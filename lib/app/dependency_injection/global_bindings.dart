import 'package:get/get.dart';
import 'package:kopa_app/app/data/repositories/archive/archive_repository.dart';
import 'package:kopa_app/app/data/repositories/archive/archive_repository_impl.dart';
import 'package:kopa_app/app/data/repositories/auth/auth_repository.dart';
import 'package:kopa_app/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository_impl.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository_impl.dart';
import 'package:kopa_app/app/modules/home/controllers/home_controller.dart';
import 'package:kopa_app/store/filter.store.dart';

enum Flavor { DEV, PROD }

class GlobalBinding extends Bindings {
  static late Flavor flavor;

  GlobalBinding(Flavor _flavor) {
    flavor = _flavor;
  }

  @override
  void dependencies() async{
    // if (flavor == Flavor.DEV) {
    //   DioManager.configure(devServerUrl);
    // } else if (flavor == Flavor.PROD) {
    //   DioManager.configure(prodServerUrl);
    // }

    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(), fenix: true);
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(), fenix: true);
    Get.lazyPut<ArchiveRepository>(() => ArchiveRepositoryImpl(), fenix: true);
    // Get.lazyPut<FilterStore>(() => FilterStore().init(), fenix: true);
    await Get.putAsync(() => FilterStore().init());
    // Get.put(HomeController());

/*    Get.lazyPut<TaskRepository>(() => TaskRepositoryImpl(), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(), fenix: true);*/

  }
}