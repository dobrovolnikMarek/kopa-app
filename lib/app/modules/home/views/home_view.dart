import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/home/utils/home_form_fields.dart';
import 'package:kopa_app/app/modules/product/widgets/product_item.dart';
import 'package:kopa_app/app/widgets/custom_navigation_bar.dart';
import 'package:kopa_app/app/widgets/custom_text_label.dart';
import 'package:kopa_app/app/widgets/form/text_field_with_picker.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';

import '../controllers/home_controller.dart';

class HomeView extends BaseStatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseStatefulView<HomeView, HomeController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          color: const Color.fromRGBO(12, 205, 230, 1),
          onRefresh: () => controller.getProducts(),
          child: SafeArea(
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      enableDrag: false,
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xff4f5050),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Transform.rotate(
                              angle: math.pi / 2,
                              child: const Icon(
                                Icons.chevron_right_rounded,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: FormBuilder(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    CustomTextLabel(title: 'Модель'.tr),
                                    TextFieldWithPicker(
                                      name: HomeFormFields.MODEL.toSimpleString(),
                                      errorText: 'Оберіть модель'.tr,
                                      itemsList: controller.modelNames,
                                      onSelectItem: controller.selectValue,
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    CustomTextLabel(title: 'Матеріал'.tr),
                                    TextFieldWithPicker(
                                      name: HomeFormFields.MATERIAL.toSimpleString(),
                                      errorText: 'Оберіть матеріал'.tr,
                                      itemsList: controller.materialNames,
                                      onSelectItem: controller.selectValue,
                                    ),
                                    CustomTextLabel(title: 'Розмір'.tr),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: TextFieldWithPicker(
                                            name: HomeFormFields.SIZE_FROM.toSimpleString(),
                                            errorText: 'Оберіть розмір'.tr,
                                            onSelectItem: controller.selectValue,
                                            isSizesItems: true,
                                          ),
                                        ),
                                        const Spacer(),
                                        Flexible(
                                          child: TextFieldWithPicker(
                                            name: HomeFormFields.SIZE_TO.toSimpleString(),
                                            errorText: 'Оберіть розмір'.tr,
                                            onSelectItem: controller.selectValue,
                                            isSizesItems: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomTextLabel(title: 'Ціна'.tr),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: FormBuilderTextField(
                                            name: HomeFormFields.PRICE_FROM.toSimpleString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.38),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Flexible(
                                          child: FormBuilderTextField(
                                            name: HomeFormFields.PRICE_TO.toSimpleString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.38),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => controller.reset(),
                                  child: Text('Скинути'.toUpperCase().tr),
                                ),
                                TextButton(
                                  onPressed: () => controller.submit(),
                                  child: Text('Застосувати'.toUpperCase().tr),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(KopaApp.filter, color: Colors.white, size: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.products.value?.length,
                    itemBuilder: (context, index) {
                      return ProductItem(
                        isLiked: controller.likedProducts
                                .contains(controller.products.value![index]!.id)
                            ? true
                            : false,
                        isMine: controller.products.value![index]!.userId ==
                                controller.uid
                            ? true
                            : false,
                        product: controller.products.value![index]!,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
