import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kopa_app/app/modules/home/utils/home_form_fields.dart';
import 'package:kopa_app/store/filter.store.dart';

class HomeController extends BaseController {
  //TODO: Implement HomeController
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final formKey = GlobalKey<FormBuilderState>();
  final ProductRepository _productRepository = Get.find();
  final FilterStore _filterStore = Get.find();
  final isFormEmpty = true.obs;
  final isLoading = false.obs;
  final likedProducts = Rxn<List<String?>>();
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

  final modelField = TextEditingController();
  final materialField = TextEditingController();
  final sizeFromField = TextEditingController();
  final sizeToField = TextEditingController();
  final priceFromField = TextEditingController();
  final priceToField = TextEditingController();

  @override
  void onInit() {
    final isStoreNotEmpty = _filterStore.isStoreNotEmpty();
    if(isStoreNotEmpty){
      getProductsFromStoreParams();
    } else {
      getProducts();
    }
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
    Get.back();
    formKey.currentState?.reset();
    _filterStore.reset();
    getProducts();
  }

  void submit() async{
    if (!formKey.currentState!.saveAndValidate()) return;
    final formValue = formKey.currentState!.value;
    try {
      Get.back();
      showProgress();
      _filterStore.setModel(formValue[HomeFormFields.MODEL.toSimpleString()]);
      _filterStore.setMaterial(formValue[HomeFormFields.MATERIAL.toSimpleString()]);
      _filterStore.setSizeFrom(formValue[HomeFormFields.SIZE_FROM.toSimpleString()]);
      _filterStore.setSizeTo(formValue[HomeFormFields.SIZE_TO.toSimpleString()]);
      _filterStore.setPriceFrom(formValue[HomeFormFields.PRICE_FROM.toSimpleString()]);
      _filterStore.setPriceTo(formValue[HomeFormFields.PRICE_TO.toSimpleString()]);
      products.value =  await _productRepository.getFilteredProductsData(formValue);
    } catch (e) {
      logger.e(e);
    } finally {
      hideProgress();
    }
  }

  void setValue() {
    modelField.text = _filterStore.selectedModel.value;
    materialField.text = _filterStore.selectedMaterial.value;
    sizeFromField.text = _filterStore.selectedSizeFrom.value;
    sizeToField.text = _filterStore.selectedSizeTo.value;
    priceFromField.text = _filterStore.selectedPriceFrom.value;
    priceToField.text = _filterStore.selectedPriceTo.value;
    /*formKey.currentState!.patchValue({
      HomeFormFields.MODEL.toSimpleString(): _filterStore.selectedModel.value,
      HomeFormFields.MATERIAL.toSimpleString(): _filterStore.selectedMaterial.value,
      HomeFormFields.SIZE_FROM.toSimpleString(): _filterStore.selectedSizeFrom.value,
      HomeFormFields.SIZE_TO.toSimpleString(): _filterStore.selectedSizeTo.value,
      HomeFormFields.PRICE_FROM.toSimpleString(): _filterStore.selectedPriceFrom.value,
      HomeFormFields.PRICE_TO.toSimpleString(): _filterStore.selectedPriceTo.value,
    });*/
  }


  void selectValue(String value, String field){
    formKey.currentState!.patchValue({
      field: value,
    });
  }

  Future<void> getProducts() async {
    try {
      isLoading.value = true;
      await _getLikedProducts();
      products.value = await _productRepository.getAllProductsData();
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getProductsFromStoreParams() async {
    try{
      isLoading.value = true;
      await _getLikedProducts();
      products.value =  await _productRepository.getFilteredProductsData({
        HomeFormFields.MODEL.toSimpleString(): _filterStore.selectedModel.value,
        HomeFormFields.MATERIAL.toSimpleString(): _filterStore.selectedMaterial.value,
        HomeFormFields.SIZE_FROM.toSimpleString(): _filterStore.selectedSizeFrom.value,
        HomeFormFields.SIZE_TO.toSimpleString(): _filterStore.selectedSizeTo.value,
        HomeFormFields.PRICE_FROM.toSimpleString(): _filterStore.selectedPriceFrom.value,
        HomeFormFields.PRICE_TO.toSimpleString(): _filterStore.selectedPriceTo.value,
      });
    }
    catch (e){
      logger.e(e);
    }
    finally{
      isLoading.value = false;
    }
  }

  Future<void> _getLikedProducts() async {
    try {
      likedProducts.value = await _productRepository.getLikedProductsData();
    } catch (e) {
      logger.e(e);
    }
  }

  Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  void onChange(val, productId) async {
    if (!val == false) {
      await _productRepository.onDislikeProduct(productId);
      logger.wtf(!val, likedProducts.value);
    } else {
      await _productRepository.onLikeProduct(productId);
      logger.wtf(val, likedProducts.value);
    }
    await _getLikedProducts();
  }
}
