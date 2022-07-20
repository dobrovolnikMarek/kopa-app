import 'package:kopa_app/app/core/data/base_repository.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';

abstract class ArchiveRepository extends BaseRepository {
  Future<List<ProductModel?>> getAllArchiveProduct(String userId);
  Future<void> createArchiveProduct(ProductModel product, String id);
}
