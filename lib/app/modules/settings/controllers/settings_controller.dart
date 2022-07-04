import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';
import 'package:kopa_app/app/widgets/bottom_sheet_default_layout.dart';
import 'package:kopa_app/app/widgets/kopa_bottom_sheet.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

class SettingsController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final _imageFile = Rx<XFile?>(null);

  XFile? get imageFile => _imageFile.value;

  set imageFile(XFile? val) => _imageFile.value = val;
  final _imagePicker = ImagePicker();

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
    }
  }
}

