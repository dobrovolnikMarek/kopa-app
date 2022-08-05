import 'package:get/get.dart';

import '../app/modules/product/add_product/bindings/add_product_binding.dart';
import '../app/modules/product/add_product/views/add_product_view.dart';
import '../app/modules/auth/intro/bindings/intro_binding.dart';
import '../app/modules/auth/intro/views/intro_view.dart';
import '../app/modules/auth/login_by_phone/bindings/login_by_phone_binding.dart';
import '../app/modules/auth/login_by_phone/views/login_by_phone_view.dart';
import '../app/modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../app/modules/auth/sign_up/views/sign_up_view.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/product/liked_products/bindings/liked_products_binding.dart';
import '../app/modules/product/liked_products/views/liked_products_view.dart';
import '../app/modules/product/my_products/bindings/my_products_binding.dart';
import '../app/modules/product/my_products/views/my_products_view.dart';
import '../app/modules/product/product_info/bindings/product_info_binding.dart';
import '../app/modules/product/product_info/views/product_info_view.dart';
import '../app/modules/settings/bindings/settings_binding.dart';
import '../app/modules/settings/views/settings_view.dart';
import '../app/modules/splash/bindings/splash_binding.dart';
import '../app/modules/splash/views/splash_view.dart';
import '../app/modules/unknown/bindings/unknown_binding.dart';
import '../app/modules/unknown/views/unknown_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.INTRO;
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.UNKNOWN,
      page: () => UnknownView(),
      binding: UnknownBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_BY_PHONE,
      page: () => LoginByPhoneView(),
      binding: LoginByPhoneBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_INFO,
      page: () => ProductInfoView(),
      binding: ProductInfoBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.MY_PRODUCTS,
      page: () => MyProductsView(),
      binding: MyProductsBinding(),
    ),
    GetPage(
      name: _Paths.LIKED_PRODUCTS,
      page: () => LikedProductsView(),
      binding: LikedProductsBinding(),
    ),
  ];

  static final UNKNOWN = GetPage(
    name: _Paths.UNKNOWN,
    page: () => UnknownView(),
    binding: UnknownBinding(),
  );
}
