import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/widgets/price_tag.dart';
import 'package:kopa_app/app/widgets/splash_effect.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/product_info_controller.dart';

class ProductInfoView extends BaseStatefulWidget {
  @override
  State<ProductInfoView> createState() => _ProductInfoViewState();
}

class _ProductInfoViewState extends BaseStatefulView<ProductInfoView, ProductInfoController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(35, 35, 38, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: ListView(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                          child: Assets.images.item.image()),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const PriceTag(price: '100'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Nike 992K',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Розміри стопи: '.tr),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
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
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Матеріал: Шкіра / Поліестер',
                        style: TextStyle(
                          color: Color(0xff9a9a9a),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Опис про товар і як довго носив кросівки чи специфічні деталі взуття. натирало чи ні. чи дуло задувало. на широку ногу чи сайз не відповідає зязвленому. хвалиш взуття щоб точно купили. бо подарували дві пари, а ти за літо ще ні одної не зносив.',
                        style: TextStyle(
                          color: Color(0xff9a9a9a),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 65,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromRGBO(35, 35, 38, 1),
              child: Row(
                children: [
                  Row(
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CachedNetworkImage(
                              imageUrl: 'https://picsum.photos/200/300',
                              width: 60,
                              height: 60,
                              imageBuilder: (context, imageProvider) =>
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Продавець',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Ukraine, Vinnytsia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SplashEffect.circular(
                    onTap: () async {
                      if (await canLaunchUrl(
                        Uri(
                          scheme: 'tel',
                          path: controller.tel,
                        ),
                      )) {
                        await launchUrl(
                          Uri(
                            scheme: 'tel',
                            path: controller.tel,
                          ),
                        );
                      } else {
                        throw 'Could not launch ${controller.tel}';
                      }
                    },
                    child: Transform.rotate(
                      angle: -0.79,
                      child: Container(
                        width: 50.55,
                        height: 50.55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3d007aff),
                              blurRadius: 37,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: const Color(0xff007aff),
                        ),
                        child: Transform.rotate(
                          angle: 0.79,
                          child: const Icon(
                            KopaApp.phone,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
