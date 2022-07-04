import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/routes/app_pages.dart';

class LoginByPhoneController extends BaseController {
  //TODO: Implement LoginByPhoneController
  final formKey = GlobalKey<FormBuilderState>();

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
      final formValue = formKey.currentState!.value;
      print(formValue);
      // isShowCode.value= true;
      // final check = await _authRepository
      //     .checkPhone(formValue[LoginForm.name.name].toString());
      // await _authRepository.sendSmsCode(check.checkToken);
      Get.toNamed(
        Routes.SIGN_UP,
      );
    } catch (e) {
      print(e);
    } finally {

    }
  }
  Future<void> verifyPhone()  async{
    if (!formKey.currentState!.saveAndValidate()) return;
/*    FirebaseAuth auth = FirebaseAuth.instance;
    if (!formKey.currentState!.saveAndValidate()) return;
    final formValue = formKey.currentState!.value;
    print(formValue['phone']);
    auth.verifyPhoneNumber(
      phoneNumber: "+380" + formValue['phone'],
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        print(verificationId);
*//*        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});*//*
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );*/
    try {

      // if (!formKey.currentState!.saveAndValidate()) return;
      // final formValue = formKey.currentState!.value;
      isShowCode.value= true;
      // final check = await _authRepository
      //     .checkPhone(formValue[LoginForm.name.name].toString());
      // await _authRepository.sendSmsCode(check.checkToken);
      // Get.toNamed(
      //   Routes.OTP_CONFIRMATION,
      //   arguments: {
      //     'check': check,
      //   },
      // );
    } catch (e) {
      print(e);
    } finally {

    }
  }

}

