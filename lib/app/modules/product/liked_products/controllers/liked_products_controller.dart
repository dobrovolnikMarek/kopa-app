import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';

class LikedProductsController extends BaseController {
  //TODO: Implement LikedProductsController
  final isLoading = false.obs;
  final ProductRepository _productRepository = Get.find();
  final products = Rxn<List<ProductModel?>>();
  final likedProducts = <ProductModel?>[];
  @override
  void onInit() {
    // before first render
    getProducts();
    super.onInit();
  }

  @override
  void onReady() {
    // after first render
    // delete onReady if this is not needed
    super.onReady();
  }

  @override
  void onClose() {
    // dispose here
    // delete onClose if this is not needed
    super.onClose();
  }

  Future<void> getProducts() async {
    try {
      likedProducts.clear();
      isLoading.value = true;
      products.value = await _productRepository.getAllProductsData();
      var liked = await _productRepository.getLikedProductsData();
      for (String? id in liked){
        likedProducts.addAll(products.value!.where((element) => element!.id == id).toList());
      }
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }
}