import 'package:flutter/cupertino.dart';
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
import 'package:kopa_app/resources/gen/assets.gen.dart';
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
      body: Stack(
        children: [
          Assets.images.mainBg.image(width: Get.width, height: Get.height, fit: BoxFit.cover),
          Obx(() {
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
                        controller.setValue();
                        Get.bottomSheet(
                          enableDrag: false,
                          backgroundColor: const Color(0xff4f5050),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              const Icon(
                                CupertinoIcons.chevron_compact_down,
                                size: 35,
                                color: Colors.black,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                child: FormBuilder(
                                  key: controller.formKey,
                                  child: Column(
                                    children: [
                                      CustomTextLabel(title: 'Модель'.tr),
                                      TextFieldWithPicker(
                                        name: HomeFormFields.MODEL.toSimpleString(),
                                        itemsList: controller.modelNames,
                                        onSelectItem: controller.selectValue,
                                        textController: controller.modelField,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomTextLabel(title: 'Матеріал'.tr),
                                      TextFieldWithPicker(
                                        name: HomeFormFields.MATERIAL
                                            .toSimpleString(),
                                        itemsList: controller.materialNames,
                                        onSelectItem: controller.selectValue,
                                        textController: controller.materialField,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomTextLabel(title: 'Розмір'.tr),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: TextFieldWithPicker(
                                              name: HomeFormFields.SIZE_FROM
                                                  .toSimpleString(),
                                              onSelectItem: controller.selectValue,
                                              isSizesItems: true,
                                              textController: controller.sizeFromField,
                                            ),
                                          ),
                                          const Spacer(),
                                          Flexible(
                                            child: TextFieldWithPicker(
                                              name: HomeFormFields.SIZE_TO
                                                  .toSimpleString(),
                                              onSelectItem: controller.selectValue,
                                              isSizesItems: true,
                                              textController: controller.sizeToField,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomTextLabel(title: 'Ціна'.tr),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: FormBuilderTextField(
                                              name: HomeFormFields.PRICE_FROM
                                                  .toSimpleString(),
                                              controller: controller.priceFromField,
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
                                              name: HomeFormFields.PRICE_TO
                                                  .toSimpleString(),
                                              controller: controller.priceToField,
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
                        );
                      },
                      icon:
                          const Icon(KopaApp.filter, color: Colors.white, size: 15),
                    ),
                    controller.products.value!.isEmpty
                        ? Center(
                            child: Text('Нічого не знайдено'.tr),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.products.value?.length,
                              itemBuilder: (context, index) {
                                return ObxValue<Rxn<List<String?>>>(
                                    (likedProducts) {
                                  return ProductItem(
                                    isLiked: likedProducts.value!.contains(
                                            controller.products.value![index]!.id)
                                        ? true
                                        : false,
                                    isMine:
                                        controller.products.value![index]!.userId ==
                                                controller.uid
                                            ? true
                                            : false,
                                    product: controller.products.value![index]!,
                                    getProducts: controller.getProducts,
                                    onChange: controller.onChange,
                                  );
                                }, controller.likedProducts);
                              },
                            ),
                          )
                  ],
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(
        index: 0,
      ),
    );
  }
}
