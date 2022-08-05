import 'dart:async';
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
import 'package:kopa_app/routes/app_pages.dart';
import 'package:xid/xid.dart';

class AddProductController extends BaseController {
  //TODO: Implement AddProductController
  final formKey = GlobalKey<FormBuilderState>();
  ProductModel? product;
  final ProductRepository _productRepository = Get.find();
  UserModel? data;
  final UserRepository _userRepository = Get.find();
  final isLoading = false.obs;
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
  final List<Map<String, String>> sizeTypesNames = [
    {
      'full': '',
      'short': '',
    },
    {
      'full': 'Европейський  EU',
      'short': 'EU',
    },
    {
      'full': 'Український UA',
      'short': 'UA',
    },
    {
      'full': 'Британський  GB',
      'short': 'GB',
    },
  ];

  @override
  void onInit() async {
    // before first render
    _getUser();
    product = await Get.arguments['product'];
    super.onInit();
  }

  @override
  void onReady() async {
    if (product != null) {
      showProgress();
      Timer(const Duration(milliseconds: 500), () => _setInfo());
      hideProgress();
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
    formKey.currentState!.patchValue({
      field: value,
    });
  }

  Future<void> submit() async {
    var id = Xid().toString();
    try {
      showProgress();
      if (!formKey.currentState!.saveAndValidate()) return;
      final formValue = formKey.currentState!.value;
      await _productRepository.createProduct(
        ProductModel(
            id: id,
            material: formValue[AddProductFormFields.MATERIAL.toSimpleString()],
            model: formValue[AddProductFormFields.MODEL.toSimpleString()],
            photos: formValue[AddProductFormFields.PHOTOS.toSimpleString()],
            price: int.parse(
                formValue[AddProductFormFields.PRICE.toSimpleString()]),
            userId: data!.id!,
            description:
                formValue[AddProductFormFields.DESCRIPTION.toSimpleString()],
            size: double.parse(
                formValue[AddProductFormFields.SIZE.toSimpleString()]),
            sizeInfo: {
              AddProductFormFields.SIZETYPE.toSimpleString():
                  formValue[AddProductFormFields.SIZETYPE.toSimpleString()],
              AddProductFormFields.WIDTH.toSimpleString(): double.parse(
                  formValue[AddProductFormFields.WIDTH.toSimpleString()]),
              AddProductFormFields.LENGTH.toSimpleString(): double.parse(
                  formValue[AddProductFormFields.LENGTH.toSimpleString()]),
            }),
        id,
      );
    } catch (e) {
      logger.e(e);
    } finally {
      hideProgress();
      Get.offAllNamed(
        Routes.MY_PRODUCTS,
      );
    }
  }

  Future<void> updateProduct() async {
    try {
      showProgress();
      if (!formKey.currentState!.saveAndValidate()) return;
      final formValue = formKey.currentState!.value;
      await _productRepository.updateProduct(
        ProductModel(
            id: product!.id,
            material: formValue[AddProductFormFields.MATERIAL.toSimpleString()],
            model: formValue[AddProductFormFields.MODEL.toSimpleString()],
            photos: formValue[AddProductFormFields.PHOTOS.toSimpleString()],
            price: int.parse(
                formValue[AddProductFormFields.PRICE.toSimpleString()]),
            userId: data!.id!,
            description:
                formValue[AddProductFormFields.DESCRIPTION.toSimpleString()],
            size: double.parse(
                formValue[AddProductFormFields.SIZE.toSimpleString()]),
            sizeInfo: {
              AddProductFormFields.SIZETYPE.toSimpleString():
                  formValue[AddProductFormFields.SIZETYPE.toSimpleString()],
              AddProductFormFields.WIDTH.toSimpleString(): double.parse(
                  formValue[AddProductFormFields.WIDTH.toSimpleString()]),
              AddProductFormFields.LENGTH.toSimpleString(): double.parse(
                  formValue[AddProductFormFields.LENGTH.toSimpleString()]),
            }),
        product!.id,
      );
    } catch (e) {
      logger.e(e);
    } finally {
      Timer(
        const Duration(milliseconds: 500),
        () => Get.offAllNamed(
          Routes.MY_PRODUCTS,
        ),
      );
      hideProgress();
    }
  }

  void _setInfo() {
    formKey.currentState!.patchValue({
      AddProductFormFields.PHOTOS.toSimpleString(): product!.photos,
      AddProductFormFields.SIZE.toSimpleString(): product!.size.toString(),
      AddProductFormFields.SIZETYPE.toSimpleString():
          product!.sizeInfo['sizeType'].toString(),
      AddProductFormFields.WIDTH.toSimpleString():
          product!.sizeInfo['width'].toString(),
      AddProductFormFields.LENGTH.toSimpleString():
          product!.sizeInfo['length'].toString(),
      AddProductFormFields.MODEL.toSimpleString(): product!.model,
      AddProductFormFields.MATERIAL.toSimpleString(): product!.material,
      AddProductFormFields.DESCRIPTION.toSimpleString(): product!.description,
      AddProductFormFields.PRICE.toSimpleString(): product!.price.toString(),
    });
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
