import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/widgets/custom_auto_size_text.dart';

class SizeInfo extends StatelessWidget {
  const SizeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '40',
                style: TextStyle(
                  color: Color(0xff0ccde6),
                  fontSize: 22,
                ),
              ),
              Text(
                'EU'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '28.5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                'Довжина / см'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '10',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                'Ширина / см'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
