import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        Assets.images.auth.ellipse.image(width: 215, height: 115),
        Text(
          'Вхід'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
