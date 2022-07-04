import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/routes/app_pages.dart';

class SignUpController extends BaseController {
  //TODO: Implement SignUpController

  final formKey = GlobalKey<FormBuilderState>();

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
      Get.offAllNamed(
        Routes.HOME,
      );
    } catch (e) {
      print(e);
    } finally {

    }
  }
}

