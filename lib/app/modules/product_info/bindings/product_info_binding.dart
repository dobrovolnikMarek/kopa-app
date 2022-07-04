import 'package:get/get.dart';

import '../controllers/product_info_controller.dart';

class ProductInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductInfoController>(
      () => ProductInfoController(),
    );
  }
}
