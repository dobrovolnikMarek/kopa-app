import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/auth/intro/widgets/auth_item.dart';
import 'package:kopa_app/app/modules/auth/widgets/auth_title.dart';
import 'package:kopa_app/routes/app_pages.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';
import '../controllers/intro_controller.dart';


class IntroView extends BaseStatefulWidget {
  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends BaseStatefulView<IntroView, IntroController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Assets.images.logo.image(fit: BoxFit.fill),
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              const AuthTitle(),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AuthItem(
                    icon: KopaApp.phone,
                    color: const Color(0xff42ff00),
                    tap: () => Get.toNamed(Routes.LOGIN_BY_PHONE),
                  ),
                  AuthItem(
                    icon: KopaApp.facebook,
                    color: const Color(0xff43419b),
                    tap: () {},
                  ),
                  AuthItem(
                    icon: KopaApp.google,
                    color: const Color(0xffff0000),
                    tap: () => controller.authByGoogle(),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
