import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/home/widgets/product_item.dart';
import 'package:kopa_app/app/widgets/custom_navigation_bar.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';

import '../controllers/home_controller.dart';

import 'package:flutter/material.dart';

class HomeView extends BaseStatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseStatefulView<HomeView, HomeController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    Text('asdasdasdasd'),
                  );
                },
                icon: const Icon(KopaApp.filter, color: Colors.white, size: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ObxValue<RxBool>((liked) {
                      return ProductItem(
                        isLiked: controller.liked.value,
                        onLiked: controller.onChange,
                      );
                    }, controller.liked);
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar());
  }
}
