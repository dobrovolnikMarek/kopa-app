import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/routes/app_pages.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

import '../controllers/unknown_controller.dart';

class UnknownView extends BaseStatefulWidget {
  @override
  State<UnknownView> createState() => _UnknownViewState();
}

class _UnknownViewState extends BaseStatefulView<UnknownView, UnknownController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnknownView'),
        centerTitle: true,
      ),
      body: Center(
          child: MainButton(
            text: 'На головну'.tr,
            onPressed: ()=> Get.offAllNamed(Routes.HOME),
          )
      ),
    );
  }
}
