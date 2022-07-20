import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends BaseController {
  //TODO: Implement HomeController
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final formKey = GlobalKey<FormBuilderState>();
  final ProductRepository _productRepository = Get.find();
  final isFormEmpty = true.obs;
  final isLoading = false.obs;
  var likedProducts = <String?>[];
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
  final liked = false.obs;
  final products = Rxn<List<ProductModel?>>();
  @override
  void onInit() {
    getProducts();

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

  void reset(){
    formKey.currentState?.reset();
  }

  void submit(){
    if (!formKey.currentState!.saveAndValidate()) return;
    final formValue = formKey.currentState!.value;
    _productRepository.getFilteredProductsData(formValue);
  }


  void selectValue(String value, String field){
    formKey.currentState!.patchValue({
      field: value,
    });
  }

  Future<void> getProducts() async {
    try {
      isLoading.value = true;
      _getLikedProducts();
      products.value = await _productRepository.getAllProductsData();
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> _getLikedProducts() async {
    try {
      likedProducts = await _productRepository.getLikedProductsData();
    } catch (e) {
      logger.e(e);
    }
  }
}
