import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final firestoreProductData =
      FirebaseFirestore.instance.collection('products');
  final firestoreLikedData = FirebaseFirestore.instance.collection('liked');

  @override
  Future<List<ProductModel?>> getAllProductsData() async {
    try {
      final querySnapshot = await firestoreProductData.get();
      return querySnapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    firestoreProductData.doc(productId).delete();
  }

  @override
  Future<List<ProductModel?>> getActiveProductsData() async {
    try {
      var activeProducts = await firestoreProductData
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      return activeProducts.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<ProductModel?>> getFilteredProductsData(
      Map<String, dynamic> data) async {
    try {
      var activeProducts = await firestoreProductData
          .where("model", isEqualTo: data['model'])
          .where("material", isEqualTo: data['material'])
          .where("price", isGreaterThanOrEqualTo: data['priceFrom'])
          .where("price", isLessThanOrEqualTo: data['priceTo'])
          .get();
      return activeProducts.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<String?>> getLikedProductsData() async {
    try {
      var likedProducts = await firestoreLikedData
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      return likedProducts.data()!['liked_posts'].cast<String>();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> createLiked(String uid) async {
    firestoreLikedData.doc(uid).set({'liked_posts': []});
  }

  @override
  Future<void> onLikeProduct(String productId) async {
    try {
      await firestoreLikedData
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'liked_posts': FieldValue.arrayUnion([productId]),
      });
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> onDislikeProduct(String productId) async {
    try {
      var likedProducts = await firestoreLikedData
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      List<String> newLikedProducts = likedProducts.data()!['liked_posts'].cast<String>();
      newLikedProducts.remove(productId);
      await firestoreLikedData
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'liked_posts': FieldValue.arrayUnion(newLikedProducts),
      });
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<List<String>> uploadProductPhotos(
      List<XFile> files, String productId) async {
    final imagesUrls = <String>[];
    try {
      for (XFile file in files) {
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child('products')
            .child('$productId/${file.name}')
            .putFile(File(file.path));
        TaskSnapshot snapshot = await uploadTask;
        String productImageUrl = await snapshot.ref.getDownloadURL();
        imagesUrls.add(productImageUrl);
      }
      return imagesUrls;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> createProduct(ProductModel product, String id) async {
    firestoreProductData.doc(id).set(product.toJson());
  }
}
