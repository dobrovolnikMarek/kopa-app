import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/modules/product/add_product/utils/add_product_form_fields.dart';
import 'package:kopa_app/app/widgets/bottom_sheet_default_layout.dart';
import 'package:kopa_app/app/widgets/kopa_bottom_sheet.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

class ImageFormField extends StatefulWidget {
  final List<String>? photos;

  const ImageFormField({Key? key, this.photos}) : super(key: key);

  @override
  _ImageFormFieldState createState() => _ImageFormFieldState();
}

class _ImageFormFieldState extends State<ImageFormField> {
  final _picker = ImagePicker();

  Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  String productPhotoToBase64(XFile file) {
    final imagesBase = <String>[];
    try {
      File img = File(file.path);
      Uint8List bytes = img.readAsBytesSync();
      String base64Image = base64Encode(bytes);
      imagesBase.add(base64Image);
      return base64Image;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> _selectPhoto(FormFieldState<List<String>> field) async {
    final source = await showConfirmationBottomSheet(
      layout: BottomSheetDefaultLayout(
        title: '',
        actions: [
          MainButton(
              onPressed: () => Get.back(result: {'source': ImageSource.camera}),
              text: 'Камера'.tr),
          MainButton(
              onPressed: () =>
                  Get.back(result: {'source': ImageSource.gallery}),
              text: 'Внутрішнє сховище'.tr),
        ],
      ),
    );

    if (source['source'] != null) {
      final res = await _picker.pickImage(source: source['source']!);
      field.didChange([...?field.value, productPhotoToBase64(res!)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 265),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: FormBuilderField<List<String>>(
          key: Key(AddProductFormFields.PHOTOS.toSimpleString()),
          name: AddProductFormFields.PHOTOS.toSimpleString(),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Додайте хоча б одне фото '.tr,
            ),
          ]),
          builder: (field) {
            return GestureDetector(
              onTap: () => _selectPhoto(field),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 75,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, index) {
                  // return _networkImageItem(widget.photos![index], (){});
/*                  if(widget.photos != null && widget.photos!.isNotEmpty){
                    return _networkImageItem(widget.photos![index], (){});
                  }*/
                  if (index == 0 &&
                      (field.value == null || (field.value?.isEmpty ?? true))) {
                    return _firstEmptyItem();
                  }
                  if ((field.value?.length ?? 0) > index &&
                      field.value?.elementAt(index) != null) {
                    return _imageItem(field.value!.elementAt(index), () {
                      field.value!.removeAt(index);
                      field.didChange([...?field.value]);
                    });
                  }
                  return _emptyItem();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _imageItem(String image, Function onCancel) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 85,
              width: 85,
              child: Image.memory(
                convertBase64Image(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () => onCancel(),
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _emptyItem() {
    return Container(
      height: 75,
      width: 75,
      decoration: const BoxDecoration(
        color: Color(0xffe5e5ea),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }

  Widget _firstEmptyItem() {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor /*const Color(0xffe5e5ea)*/,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.camera,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
