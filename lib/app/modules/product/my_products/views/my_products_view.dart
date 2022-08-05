import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/product/my_products/controllers/my_products_controller.dart';
import 'package:kopa_app/app/widgets/custom_navigation_bar.dart';
import 'package:kopa_app/app/modules/product/widgets/product_item.dart';
import 'package:kopa_app/app/widgets/custom_sliding_switch.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';

class MyProductsView extends BaseStatefulWidget {
  @override
  State<MyProductsView> createState() => _MyProductsViewState();
}

class _MyProductsViewState
    extends BaseStatefulView<MyProductsView, MyProductsController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.mainBg.image(width: Get.width, height: Get.height, fit: BoxFit.cover),
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 25, left: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: const Color.fromRGBO(75, 75, 75, 1))
                    ),
                    child: CustomSlidingSwitch(
                      value: false,
                      width: MediaQuery.of(context).size.width - 50,
                      onChanged: (bool value) {
                        controller.onChange();
                      },
                      height : 35,
                      animationDuration : const Duration(milliseconds: 40),
                      onTap:(){},
                      onDoubleTap:(){},
                      onSwipe:(){},
                      textOff : 'Активні'.tr,
                      textOn : 'Архів'.tr,
                      colorOn : Colors.white,
                      colorOff : Colors.white,
                      background : Colors.transparent,
                      buttonColor : const Color.fromRGBO(12, 205, 230, 1),
                      inactiveColor : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(() {
                  if (controller.isActive.value) {
                    if(controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(controller.products.value!.isEmpty) {
                      return Center(
                        child: Text('У вас поки немає активних оголошень'.tr),
                      );
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.products.value?.length,
                        itemBuilder: (context, index) {
                          return ProductItem(
                            product: controller.products.value![index]!,
                            isMine: true,
                            isLiked: false,
                          );
                        },
                      );
                  } else {
                    if(controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(controller.products.value!.isEmpty) {
                      return Center(
                        child: Text('У вас поки немає архівних оголошень'.tr),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.products.value?.length,
                      itemBuilder: (context, index) {
                        return ProductItem(
                          product: controller.products.value![index]!,
                          isArchive: true,
                          isMine: true,
                        );
                      },
                    );
                  }
                })
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(
        index: 1,
      ),
    );
  }
}
