import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';
import 'package:kopa_app/app/modules/auth/login_by_phone/utils/login_form_fields.dart';
import 'package:kopa_app/routes/app_pages.dart';

class LoginByPhoneController extends BaseController {
  //TODO: Implement LoginByPhoneController
  final formKey = GlobalKey<FormBuilderState>();
  var auth = FirebaseAuth.instance;
  final UserRepository _userRepository = Get.find();
  String verificationId = "";

  final count = 0.obs;
  final isShowCode = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> submit() async {
    try {
      if (!formKey.currentState!.saveAndValidate()) return;
      showProgress();
      final credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: formKey
              .currentState!.value[LoginFormFields.CODE.toSimpleString()],
        ),
      );
      if (credential.user != null) {
        final userData = await _userRepository.getUserData(credential.user!.uid);
        userData == null ? Get.toNamed(Routes.SIGN_UP)
            : Get.offAllNamed(Routes.HOME);
      }
    } catch (err, stackTrace) {
      handleError(err, stackTrace);
    } finally {
      hideProgress();
    }
  }

  Future<void> verifyPhone() async {
    try {
      if (!formKey.currentState!.saveAndValidate()) return;
      final formValue = formKey.currentState!.value;
      showProgress();
      await auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 5),
          phoneNumber: '+380${formValue[LoginFormFields.PHONE.toSimpleString()]}',
          verificationCompleted: (AuthCredential authCredential) {
            auth.signInWithCredential(authCredential);
          },
          verificationFailed: (authException) {
            hideProgress();
            logger.w(authException.toString());
          },
          codeSent: (String id, [int? resendToken]) {
            verificationId = id;
            isShowCode.value = true;
            hideProgress();
          },
          codeAutoRetrievalTimeout: (id) {
            verificationId = id;
            hideProgress();
          });
    } catch (e) {
      logger.e(e);
    }
  }
}
