import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/product/my_products/controllers/my_products_controller.dart';
import 'package:kopa_app/app/widgets/custom_navigation_bar.dart';
import 'package:kopa_app/app/modules/product/widgets/product_item.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MyProductsView extends BaseStatefulWidget {
  @override
  State<MyProductsView> createState() => _MyProductsViewState();
}

class _MyProductsViewState
    extends BaseStatefulView<MyProductsView, MyProductsController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: ToggleSwitch(
                  animate: true,
                  borderColor: const [Color.fromRGBO(75, 75, 75, 1)],
                  borderWidth: 1,
                  minWidth: MediaQuery.of(context).size.width,
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [Color.fromRGBO(12, 205, 230, 1)],
                    [Color.fromRGBO(12, 205, 230, 1)]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.transparent,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['Активні'.tr, 'Архів'.tr],
                  radiusStyle: true,
                  onToggle: (i) => controller.onChange(),
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
      bottomNavigationBar: const CustomNavigationBar(
        index: 1,
      ),
    );
  }
}
