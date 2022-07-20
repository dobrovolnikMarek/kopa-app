import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/product/add_product/controllers/add_product_controller.dart';
import 'package:kopa_app/app/modules/product/add_product/utils/add_product_form_fields.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/app/widgets/custom_text_label.dart';
import 'package:kopa_app/app/widgets/form/image_form_field.dart';
import 'package:kopa_app/app/widgets/form/text_field_with_picker.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';

class AddProductView extends BaseStatefulWidget {
  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState
    extends BaseStatefulView<AddProductView, AddProductController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 38, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offAllNamed(Routes.SETTINGS),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => controller.submit(),
            child: Text('Зберегти'.tr),
          )
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            shrinkWrap: true,
            children: [
              FormBuilder(
                key: controller.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextLabel(title: 'Додати фото'.tr),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: ImageFormField(),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextLabel(title: 'Розмір'.tr),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Assets.images.sizeInfo.image(),
                            /*SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Column(
                                children: [
                              Flexible(
                                child: TextFieldWithPicker(
                                  name: 'size',
                                  errorText: 'Оберіть розмір'.tr,
                                  textController: controller.sizeField,
                                  onSelectItem: controller.selectValue,
                                  isSizesItems: true,
                                  prefix: Text('Розмір '.tr),
                                ),
                              ),
                              Flexible(
                                child: TextFieldWithPicker(
                                  name: 'size',
                                  errorText: 'Оберіть довжину'.tr,
                                  textController: controller.lengthField,
                                  onSelectItem: controller.selectValue,
                                  isSizesItems: true,
                                  prefix: Text('Довжина / см | '.tr),
                                ),
                              ),
                              Flexible(
                                child: TextFieldWithPicker(
                                  name: 'size',
                                  errorText: 'Оберіть ширину'.tr,
                                  textController: controller.widthField,
                                  onSelectItem: controller.selectValue,
                                  isSizesItems: true,
                                  prefix: Text('Ширина /  см | '.tr),
                                ),
                              ),
                                ],
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextLabel(title: 'Модель'.tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFieldWithPicker(
                        name: AddProductFormFields.MODEL.toSimpleString(),
                        errorText: 'Оберіть модель'.tr,
                        itemsList: controller.modelNames,
                        onSelectItem: controller.selectValue,
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextLabel(title: 'Матеріал'.tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFieldWithPicker(
                        name: AddProductFormFields.MATERIAL.toSimpleString(),
                        errorText: 'Оберіть матеріал'.tr,
                        itemsList: controller.materialNames,
                        onSelectItem: controller.selectValue,
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextLabel(title: 'Опис'.tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: FormBuilderTextField(
                        name: AddProductFormFields.DESCRIPTION.toSimpleString(),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                          color: Color.fromRGBO(188, 188, 188, 1),
                        ),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(255, 255, 255, 0.38),
                            ),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Додайте опис'.tr,
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            CustomTextLabel(title: 'Ціна'.tr),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: FormBuilderTextField(
                                name: AddProductFormFields.PRICE.toSimpleString(),
                                style: const TextStyle(
                                  color: Color.fromRGBO(188, 188, 188, 1),
                                ),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.38),
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Введіть коректну ціну '.tr,
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
