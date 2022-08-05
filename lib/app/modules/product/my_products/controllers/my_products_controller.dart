import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/archive/archive_repository.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';

class MyProductsController extends BaseController {
  //TODO: Implement MyProductsController
  final isActive = true.obs;
  final isLoading = false.obs;
  final ProductRepository _productRepository = Get.find();
  final ArchiveRepository _archiveRepository = Get.find();
  final _currentUser = FirebaseAuth.instance.currentUser;
  final products = Rxn<List<ProductModel?>>();
  @override
  void onInit() {
    // before first render
     _getActiveProducts();
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

  void onChange(){
      isActive.value = !isActive.value;
      if(isActive.value){
        _getActiveProducts();
      } else {
        _getArchiveProducts();
      }
  }

  void _getActiveProducts() async{
    try {
      isLoading.value = true;
      products.value = await _productRepository.getActiveProductsData();
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }

  void _getArchiveProducts() async{
    try {
      isLoading.value = true;
      products.value = await _archiveRepository.getAllArchiveProduct(_currentUser!.uid);
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }
}
