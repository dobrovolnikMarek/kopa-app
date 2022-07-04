import 'dart:async';

import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/routes/app_pages.dart';

class SplashController extends BaseController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    // before first render
    Timer(
        const Duration(seconds: 5),
            ()=>  Get.offAllNamed(AppPages.INITIAL)
    );
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
}

