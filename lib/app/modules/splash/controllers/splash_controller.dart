import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';
import 'package:kopa_app/routes/app_pages.dart';

class SplashController extends BaseController {
  //TODO: Implement SplashController
  final UserRepository _userRepository = Get.find();
  @override
  void onInit() {
    // before first render
    _getUserIsLoggedIn();
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

  void _getUserIsLoggedIn(){
    if (FirebaseAuth.instance.currentUser == null) {
      Get.offAllNamed(Routes.INTRO);
    } else {
      _isUserSignedUp();
    }
  }

  Future<void> _isUserSignedUp() async {
    try {
      final userData = await _userRepository.getUserData(FirebaseAuth.instance.currentUser!.uid);
      userData == null ? FirebaseAuth.instance.currentUser!.phoneNumber == null ? Get.offAllNamed(Routes.SIGN_UP) : Get.offAllNamed(Routes.SIGN_UP) : Get.offAllNamed(Routes.HOME);
    } catch (_) {
      Get.offAllNamed(Routes.SIGN_UP);
    }
  }
}

