import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:kopa_app/app/core/data/base_repository.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';

abstract class ProductRepository extends BaseRepository {
  Future<List<ProductModel?>> getAllProductsData();
  Future<List<ProductModel?>> getActiveProductsData();
  Future<void> deleteProduct(String productId);
  Future<List<ProductModel?>> getFilteredProductsData(Map<String, dynamic> data);
  Future<List<String?>> getLikedProductsData();
  Future<void> createLiked(String uid);
  Future<void> onLikeProduct(String productId);
  Future<void> onDislikeProduct(String productId);
  Future<void> createProduct(ProductModel product, String id);
  Future<List<String>> uploadProductPhotos(List<XFile> files, String productId);
}
