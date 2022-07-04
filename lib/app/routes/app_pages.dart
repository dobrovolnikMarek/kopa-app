import 'package:get/get.dart';

import '../modules/auth/intro/bindings/intro_binding.dart';
import '../modules/auth/intro/views/intro_view.dart';
import '../modules/auth/login_by_phone/bindings/login_by_phone_binding.dart';
import '../modules/auth/login_by_phone/views/login_by_phone_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_info/bindings/product_info_binding.dart';
import '../modules/product_info/views/product_info_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/auth/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/unknown/bindings/unknown_binding.dart';
import '../modules/unknown/views/unknown_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.INTRO;
  static const INITIAL = Routes.INTRO;

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
  ];

  static final UNKNOWN = GetPage(
    name: _Paths.UNKNOWN,
    page: () => UnknownView(),
    binding: UnknownBinding(),
  );
}
