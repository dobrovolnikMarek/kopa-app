import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';
import 'package:kopa_app/app/modules/home/utils/home_form_fields.dart';

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
      var filteredProducts = await firestoreProductData
          .where("model",
              isEqualTo: data[HomeFormFields.MODEL.toSimpleString()]
                      .toString()
                      .isNotEmpty
                  ? data[HomeFormFields.MODEL.toSimpleString()]
                  : null)
          .where("material",
              isEqualTo: data[HomeFormFields.MATERIAL.toSimpleString()]
                      .toString()
                      .isNotEmpty
                  ? data[HomeFormFields.MATERIAL.toSimpleString()]
                  : null)
          .where("price",
              isGreaterThanOrEqualTo:
                  data[HomeFormFields.PRICE_FROM.toSimpleString()]
                          .toString()
                          .isNotEmpty
                      ? double.tryParse(
                          data[HomeFormFields.PRICE_FROM.toSimpleString()])
                      : null)
          .where("price",
              isLessThanOrEqualTo: data[HomeFormFields.PRICE_TO.toSimpleString()]
                      .toString()
                      .isNotEmpty
                  ? double.tryParse(data[HomeFormFields.PRICE_TO.toSimpleString()])
                  : null)
          .get();
      logger.wtf('message');
      if (data[HomeFormFields.SIZE_FROM.toSimpleString()]
              .toString()
              .isNotEmpty /*!= null*/ ||
          data[HomeFormFields.SIZE_TO.toSimpleString()]
              .toString()
              .isNotEmpty /*!= null*/) {
        List<ProductModel?> newList = [];
        filteredProducts.docs.map((doc) {
          if (data[HomeFormFields.SIZE_FROM.toSimpleString()]
                  .toString()
                  .isNotEmpty &&
              data[HomeFormFields.SIZE_TO.toSimpleString()]
                  .toString()
                  .isNotEmpty) {
            if (doc.data()['size'] >=
                    double.parse(
                        data[HomeFormFields.SIZE_FROM.toSimpleString()]) &&
                doc.data()['size'] <=
                    double.parse(
                        data[HomeFormFields.SIZE_TO.toSimpleString()])) {
              logger.w(doc.data()['size']);
              newList.add(ProductModel.fromJson(doc.data()));
            }
          }
          if (data[HomeFormFields.SIZE_FROM.toSimpleString()]
                  .toString()
                  .isNotEmpty &&
              data[HomeFormFields.SIZE_TO.toSimpleString()]
                  .toString()
                  .isEmpty) {
            logger.w(data['sizeTo']);
            logger.w(data['sizeFrom']);
            if (doc.data()['size'] >=
                double.parse(data[HomeFormFields.SIZE_FROM.toSimpleString()])) {
              logger.w(doc.data()['size']);
              newList.add(ProductModel.fromJson(doc.data()));
            }
          } if(data[HomeFormFields.SIZE_FROM.toSimpleString()]
              .toString()
              .isEmpty &&
              data[HomeFormFields.SIZE_TO.toSimpleString()]
                  .toString()
                  .isNotEmpty) {
            if (doc.data()['size'] <=
                double.parse(data[HomeFormFields.SIZE_TO.toSimpleString()])) {
              logger.w(doc.data()['size']);
              newList.add(ProductModel.fromJson(doc.data()));
            }
          }
        }).toList();
        return newList;
      } else {
        return filteredProducts.docs.map((doc) {
          /* logger.w(data['sizeTo'].runtimeType);
          logger.w(data['sizeFrom']);*/

          if (data[HomeFormFields.SIZE_FROM.toSimpleString()]
                  .toString()
                  .isNotEmpty &&
              data[HomeFormFields.SIZE_TO.toSimpleString()]
                  .toString()
                  .isNotEmpty) {
            if (doc.data()['size'] >=
                    double.parse(
                        data[HomeFormFields.SIZE_FROM.toSimpleString()]) &&
                doc.data()['size'] <=
                    double.parse(
                        data[HomeFormFields.SIZE_TO.toSimpleString()])) {
              logger.w(doc.data()['size']);
              return ProductModel.fromJson(doc.data());
            }
          }
          return ProductModel.fromJson(doc.data());
        }).toList();
      }
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
      List<String> newLikedProducts =
          likedProducts.data()!['liked_posts'].cast<String>();
      newLikedProducts.remove(productId);
      await firestoreLikedData.doc(FirebaseAuth.instance.currentUser!.uid).set({
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
  List<String> productPhotosToBase64(List<XFile> files) {
    final imagesBase = <String>[];
    try {
      for (XFile file in files) {
        File img = File(file.path);
        Uint8List bytes = img.readAsBytesSync();
        String base64Image = base64Encode(bytes);
        // print(base64Image);
        // logger.wtf(base64Image);
        imagesBase.add(base64Image);
      }
      return imagesBase;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  @override
  Future<void> createProduct(ProductModel product, String id) async {
    firestoreProductData.doc(id).set(product.toJson());
  }

  @override
  Future<void> updateProduct(ProductModel product, String id) async {
    firestoreProductData.doc(id).update(product.toJson());
  }
}
