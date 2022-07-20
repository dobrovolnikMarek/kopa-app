import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';
import 'package:kopa_app/app/routes/app_pages.dart';

class IntroController extends BaseController {
  //TODO: Implement IntroControllerController
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final UserRepository _userRepository = Get.find();

  @override
  void onInit() {
    // before first render

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

  void authByGoogle() async {
    final _user = await _googleSignIn.signIn();
    if (_user == null) return;
    final googleAuth = await _user.authentication;
    final credential = await FirebaseAuth.instance.signInWithCredential(
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ),
    );
    if (credential.user != null) {
      final userData = await _userRepository.getUserData(credential.user!.uid);
      userData == null ? Get.toNamed(Routes.SIGN_UP, arguments: {
        'showPhoneField': true
      })
          : Get.offAllNamed(Routes.HOME);
    }
  }
}
