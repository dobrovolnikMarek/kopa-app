import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/product/liked_products/controllers/liked_products_controller.dart';
import 'package:kopa_app/app/widgets/custom_navigation_bar.dart';
import 'package:kopa_app/app/modules/product/widgets/product_item.dart';

class LikedProductsView extends BaseStatefulWidget {
  @override
  State<LikedProductsView> createState() => _LikedProductsViewState();
}

class _LikedProductsViewState extends BaseStatefulView<LikedProductsView, LikedProductsController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: ObxValue<RxBool>((isLoading){
        if(isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(controller.likedProducts.isEmpty) {
          return Center(
            child: Text('У вас поки немає улюблених оголошень'.tr),
          );
        }
        return  RefreshIndicator(
          onRefresh: () => controller.getProducts(),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.likedProducts.length,
              itemBuilder: (context, index) {
                  return ProductItem(
                    isLiked: true,
                    product: controller.likedProducts[index]!,
                  );
              },
            ),
          ),
        );
      },controller.isLoading),
      bottomNavigationBar: const CustomNavigationBar(
        index: 3,
      ),
    );
  }
}