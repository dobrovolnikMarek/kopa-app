import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';
import 'package:kopa_app/app/data/repositories/auth/auth_repository.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';
import 'package:kopa_app/app/modules/auth/sign_up/utils/sign_up_form_fields.dart';
import 'package:kopa_app/app/routes/app_pages.dart';

class SignUpController extends BaseController {
  //TODO: Implement SignUpController

  final formKey = GlobalKey<FormBuilderState>();
  final _currentUser = FirebaseAuth.instance.currentUser;
  final ProductRepository _productRepository = Get.find();
  final AuthRepository _authRepository = Get.find();
  bool isShowPhoneField = false;

  @override
  void onInit() async{
    isShowPhoneField = await Get.arguments['showPhoneField'] ?? false;
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
      showProgress();
      _authRepository.createUser(
        UserModel(
          id: _currentUser!.uid,
          phone: _currentUser!.phoneNumber ?? '+380${formValue[SignUpFormFields.PHONE.toSimpleString()]}',
          email: _currentUser!.email,
          firstName: formValue[SignUpFormFields.FIRSTNAME.toSimpleString()],
          lastName: formValue[SignUpFormFields.LASTNAME.toSimpleString()],
          city: formValue[SignUpFormFields.CITY.toSimpleString()],
          imgUrl: _currentUser!.photoURL
        ),
      );
      _productRepository.createLiked(_currentUser!.uid);
      Get.offAllNamed(
        Routes.HOME,
      );
    } catch (e) {
      print(e);
    } finally {
      hideProgress();
    }
  }
}

