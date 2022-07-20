import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/modules/product/widgets/size_info.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/app/modules/product/widgets/price_tag.dart';
import 'package:kopa_app/app/widgets/custom_auto_size_text.dart';
import 'package:kopa_app/app/widgets/splash_effect.dart';

import '../../../data/models/external/product/product.model.dart';

class ProductItem extends StatelessWidget {
  final bool? isLiked;
  final bool? isArchive;
  final bool? isMine;
  final ProductModel product;

  const ProductItem({
    Key? key,
    this.isLiked,
    required this.product,
    this.isArchive,
    this.isMine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, right: 20, left: 20),
          child: SplashEffect.circular(
            onTap: isArchive != null
                ? null
                : () {
                    Get.toNamed(Routes.PRODUCT_INFO, arguments: {
                      'product': product,
                      'isLiked': isLiked,
                    });
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
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: product.photos.first,
                            width: 140,
                            height: 120,
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: CustomAutoSizeText(
                                  text: product.model,
                                  presetFontSizes: 16,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              CustomAutoSizeText(
                                text: 'Розміри стопи: '.tr,
                                presetFontSizes: 10,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizeInfo(),
                              CustomAutoSizeText(
                                text: 'Матеріал: ${product.material}'.tr,
                                presetFontSizes: 10,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xff9a9a9a),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                isMine != null && isMine == true
                    ? const Offstage()
                    : Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(
                          Icons.favorite,
                          color: isLiked != null && isLiked == true
                              ? Colors.red
                              : Colors.white,
                          size: 35,
                        ),
                      ),
                isArchive != null && isArchive == true
                    ? Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: const Color(0xa5000000),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 5.0),
                            child: Text('Продано'.tr),
                          ),
                        ),
                      )
                    : const Offstage()
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: PriceTag(
            price: product.price,
          ),
        ),
      ],
    );
  }
}
