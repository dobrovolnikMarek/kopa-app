import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    // if (flavor == Flavor.DEV) {
    //   DioManager.configure(devServerUrl);
    // } else if (flavor == Flavor.PROD) {
    //   DioManager.configure(prodServerUrl);
    // }

    // Get.lazyPut<UserRepository>(() => UserRepositoryImpl(), fenix: true);
  }
}
