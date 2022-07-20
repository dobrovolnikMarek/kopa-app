import 'package:get/get.dart';

import '../controllers/liked_products_controller.dart';

class LikedProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LikedProductsController>(
      () => LikedProductsController(),
    );
  }
}
