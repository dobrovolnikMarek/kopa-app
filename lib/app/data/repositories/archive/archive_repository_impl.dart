import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/archive/archive_repository.dart';


class ArchiveRepositoryImpl extends ArchiveRepository {
  final firestoreUserData = FirebaseFirestore.instance.collection('archive');

  @override
  Future<List<ProductModel?>> getAllArchiveProduct(String userId) async {
    try {
      var activeProducts = await firestoreUserData
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      return activeProducts.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    }
    catch (e){
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> createArchiveProduct(ProductModel product, String id) async {
    firestoreUserData.doc(id).set(product.toJson());
  }
}
