import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/routes/app_pages.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';

class CustomNavigationBar extends StatefulWidget {
  final int index;

  const CustomNavigationBar({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  int? localIndex;
  List<String> routes = [
    Routes.HOME,
    Routes.MY_PRODUCTS,
    Routes.ADD_PRODUCT,
    Routes.LIKED_PRODUCTS,
    Routes.SETTINGS,
  ];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    localIndex = widget.index;
    _tabController = TabController(
        vsync: this, length: routes.length, initialIndex: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      controller: _tabController,
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
      initialActiveIndex: widget.index,
      onTap: (int i) async {
        if (i == widget.index) {
          return;
        }
        if (routes[i] == Routes.ADD_PRODUCT) {
          var prevIndex = widget.index;
          await Get.toNamed(routes[i]);
          setState(() {
            _tabController.animateTo(prevIndex);
          });
        } else {
          _tabController.animateTo(i);
          Get.offAllNamed(routes[i]);
        }
      },
    );
  }
}
