import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';
import 'package:kopa_app/app/modules/product/add_product/utils/add_product_form_fields.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:xid/xid.dart';
import 'package:flutter/scheduler.dart';

class AddProductController extends BaseController {
  //TODO: Implement AddProductController
  final formKey = GlobalKey<FormBuilderState>();

  final sizeField = TextEditingController();
  final lengthField = TextEditingController();
  final widthField = TextEditingController();
  final modelField = TextEditingController();
  final descriptionField = TextEditingController();
  final priceField = TextEditingController();
  final materialField = TextEditingController();
  final List<String> modelNames = [
    '',
    'Nike 2200',
    'Nike airmax',
    'Nike 2190',
  ];
  final List<String> materialNames = [
    '',
    'Натуральна шкіра',
    'Штучна шкіра',
    'Поліестер',
  ];

  ProductModel? product;
  final ProductRepository _productRepository = Get.find();
  UserModel? data;
  final UserRepository _userRepository = Get.find();
  final isLoading = false.obs;
  final isUploading = false.obs;

  @override
  void onInit()  {
    // before first render
    _getUser();


    super.onInit();
  }

  @override
  void onReady() async {
    product = await Get.arguments['product'];
    if (product != null) {

      SchedulerBinding.instance.addPostFrameCallback((_) => _setInfo());
      // _setInfo();
    }
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

  void selectValue(String value, String field) {
    // controller.text = value;
    formKey.currentState!.patchValue({
      field: value,
    });
  }

  Future<void> submit() async {
    var id = Xid().toString();
    try {
      isUploading.value = true;
      if (!formKey.currentState!.saveAndValidate()) return;
      final formValue = formKey.currentState!.value;
      final imagesUrls = await _productRepository.uploadProductPhotos(
        formValue['photos'],
        id,
      );
      await _productRepository.createProduct(
          ProductModel(
            id: id,
            material: formValue['material'],
            model: formValue['model'],
            photos: imagesUrls,
            price: formValue['price'],
            userId: data!.id!,
            description: formValue['description'],
          ),
          id);
      // isShowCode.value= true;
      // final check = await _authRepository
      //     .checkPhone(formValue[LoginForm.name.name].toString());
      // await _authRepository.sendSmsCode(check.checkToken);
      Get.offAllNamed(
        Routes.HOME,
      );
    } catch (e) {
      logger.e(e);
    } finally {
      isUploading.value = false;
    }
  }

  void _setInfo() {

/*    formKey.currentState!.patchValue({
      AddProductFormFields.MODEL.toSimpleString(): product!.model,
      AddProductFormFields.MATERIAL.toSimpleString(): product!.material,
      AddProductFormFields.DESCRIPTION.toSimpleString(): product!.description,
      AddProductFormFields.PRICE.toSimpleString(): product!.price,
    });*/
      modelField.text = product!.model;
      materialField.text = product!.material;
      descriptionField.text = product!.description;
      priceField.text = product!.price;
  }

  Future<void> _getUser() async {
    try {
      isLoading.value = true;
      data = await _userRepository
          .getUserData(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }
}
