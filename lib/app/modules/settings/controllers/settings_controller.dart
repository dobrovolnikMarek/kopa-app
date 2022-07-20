import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/app/widgets/bottom_sheet_default_layout.dart';
import 'package:kopa_app/app/widgets/kopa_bottom_sheet.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

class SettingsController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final _imageFile = Rx<XFile?>(null);
  final UserRepository _userRepository = Get.find();
  XFile? get imageFile => _imageFile.value;
  UserModel? data;
  final isLoading = false.obs;

  set imageFile(XFile? val) => _imageFile.value = val;
  final _imagePicker = ImagePicker();

  @override
  void onInit() {
    _getUser();
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

  void takePicture() async {
    final source = await showConfirmationBottomSheet(
        layout: BottomSheetDefaultLayout(
          title: '',
          actions: [
            MainButton(
                onPressed: () => Get.back(result: {'source': ImageSource.camera}),
                text: 'Камера'.tr),
            MainButton(
                onPressed: () => Get.back(result: {'source': ImageSource.gallery}),
                text: 'Внутрішнє сховище'.tr),
          ],
        ));
    if (source['source'] != null) {
      final pickedFile =
      await _imagePicker.pickImage(source: source['source']!);
      imageFile = pickedFile;
      if(pickedFile != null) {
        final link = await _userRepository.uploadUserPhoto(data!.id!, File(pickedFile.path), pickedFile.name);
        await _userRepository.updateUser(FirebaseAuth.instance.currentUser!.uid, {
          'imgUrl': link
        });
      }
    }
  }

  Future<void> _getUser() async {
    try {
      isLoading.value = true;
      data = await _userRepository.getUserData(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }

  void signOut(){
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.INTRO);
  }
}

