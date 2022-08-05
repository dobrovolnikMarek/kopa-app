import 'package:flutter/material.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';
import '../controllers/splash_controller.dart';


class SplashView extends BaseStatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseStatefulView<SplashView, SplashController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.logo.image(),
          const CircularProgressIndicator(
            color: Color.fromRGBO(12, 205, 230, 1),
          ),
        ],
      ),
    );
  }
}

