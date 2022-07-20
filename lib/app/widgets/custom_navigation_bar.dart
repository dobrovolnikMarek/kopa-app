import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';

class CustomNavigationBar extends StatelessWidget {
  final int? index;

  const CustomNavigationBar({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> routes = [
      Routes.HOME,
      Routes.MY_PRODUCTS,
      Routes.ADD_PRODUCT,
      Routes.LIKED_PRODUCTS,
      Routes.SETTINGS,
    ];
    return ConvexAppBar(
      height: 70,
      style: TabStyle.fixedCircle,
      backgroundColor: const Color(0xff4f5050),
      activeColor: const Color.fromRGBO(12, 205, 230, 1),
      color: const Color(0xffa1a1a1),
      items: const [
        TabItem(icon: KopaApp.home),
        TabItem(icon: KopaApp.sneaker),
        TabItem(icon: Icons.add),
        TabItem(icon: Icons.favorite),
        TabItem(icon: KopaApp.gear),
      ],
      initialActiveIndex: index ?? 0,
      // onTap: (int i) => Get.toNamed(routes[i]),
      onTap: (int i) => Get.offAllNamed(routes[i]),
    );
  }
}
