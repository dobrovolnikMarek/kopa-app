import 'package:get/get.dart';

import '../controllers/login_by_phone_controller.dart';

class LoginByPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginByPhoneController>(
      () => LoginByPhoneController(),
    );
  }
}
