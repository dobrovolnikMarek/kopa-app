import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/app/widgets/price_tag.dart';
import 'package:kopa_app/app/widgets/splash_effect.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';

class ProductItem extends StatelessWidget {
  final Function onLiked;
  final bool isLiked;

  const ProductItem({Key? key, required this.onLiked, required this.isLiked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 20, left: 20),
      child: SplashEffect.circular(
        onTap: () {
          Get.toNamed(Routes.PRODUCT_INFO);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(52, 52, 52, 1),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Assets.images.item
                          .image(fit: BoxFit.cover, width: 140, height: 120),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nike 992K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Розміри стопи: '.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Column(
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
                        ),
                        Text(
                          'Матеріал: Шкіра'.tr,
                          style: const TextStyle(
                            color: Color(0xff9a9a9a),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 0,
              child: PriceTag(
                price: '100',
              ),
            ),
            IconButton(
              onPressed: () {
                onLiked(isLiked);
              },
              icon: isLiked
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite),
            )
          ],
        ),
      ),
    );
  }
}
