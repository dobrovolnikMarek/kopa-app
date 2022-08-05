import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/product/product.model.dart';
import 'package:kopa_app/app/data/repositories/archive/archive_repository.dart';
import 'package:kopa_app/app/data/repositories/product/product_repository.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';
import 'package:kopa_app/app/modules/product/add_product/utils/add_product_form_fields.dart';
import 'package:kopa_app/routes/app_pages.dart';

import '../../../../data/models/external/auth/user.model.dart';

class ProductInfoController extends BaseController {
  //TODO: Implement ProductInfoController
  String tel = '';
  UserModel? seller;
  ProductModel? product;
  final isMineProduct = false.obs;
  final isLiked = false.obs;
  final isLoading = false.obs;
  final UserRepository _userRepository = Get.find();
  final ProductRepository _productRepository = Get.find();
  final ArchiveRepository _archiveRepository = Get.find();
  final activeImgIndex = 0.obs;

  @override
  void onInit() {
    _getSellerInfo();
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

  void onIndexChanged(int index) {
    activeImgIndex.value = index;
  }

  void onChange(val, productId) {
    isLiked.value = !val;
    if (isLiked.value == false) {
      _productRepository.onDislikeProduct(productId);
    } else {
      _productRepository.onLikeProduct(productId);
    }
  }

  Future<void> _getSellerInfo() async {
    try {
      isLoading.value = true;
      product = await Get.arguments['product'];
      isLiked.value = await Get.arguments['isLiked'];
      if (product!.userId != FirebaseAuth.instance.currentUser!.uid) {
        seller = await _userRepository.getUserData(product!.userId);
        tel = seller!.phone!;
      } else {
        isMineProduct.value = true;
      }
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct() async {
    try {
      showProgress();
      await _archiveRepository.createArchiveProduct(
          ProductModel(
            id: product!.id,
            photos: product!.photos,
            model: product!.model,
            material: product!.material,
            description: product!.description,
            price: product!.price,
            userId: product!.userId,
            size: product!.size,
            sizeInfo: {
              AddProductFormFields.SIZETYPE.toSimpleString():
              product!.sizeInfo[AddProductFormFields.SIZETYPE.toSimpleString()],
              AddProductFormFields.WIDTH.toSimpleString():
                  product!.sizeInfo[AddProductFormFields.WIDTH.toSimpleString()],
              AddProductFormFields.LENGTH.toSimpleString():
                  product!.sizeInfo[AddProductFormFields.LENGTH.toSimpleString()],
            },

          ),
          product!.id);
      await _productRepository.deleteProduct(product!.id);
      hideProgress();
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      logger.e(e);
    }
  }
}
