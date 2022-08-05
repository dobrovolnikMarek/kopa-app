import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/modules/product/add_product/utils/add_product_form_fields.dart';

class SizeInfo extends StatelessWidget {
  // final Map<String, dynamic> sizeInfo;
  final double size;
  final Map<String, dynamic> sizeInfo;

  const SizeInfo({
    Key? key,
    required this.sizeInfo,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // size,
                size.toString(),
                style: const TextStyle(
                  color: Color(0xff0ccde6),
                  fontSize: 22,
                ),
              ),
              Text(
                sizeInfo[AddProductFormFields.SIZETYPE.toSimpleString()],
                // sizeType,
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
              Text(
                sizeInfo[AddProductFormFields.LENGTH.toSimpleString()]
                    .toString(),
                // length.toString(),
                style: const TextStyle(
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
              Text(
                sizeInfo[AddProductFormFields.WIDTH.toSimpleString()]
                    .toString(),
                // width.toString(),
                style: const TextStyle(
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
