import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/product/widgets/size_info.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/app/widgets/custom_dialog.dart';
import 'package:kopa_app/app/widgets/main_button.dart';
import 'package:kopa_app/app/modules/product/widgets/price_tag.dart';
import 'package:kopa_app/app/widgets/splash_effect.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/product_info_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductInfoView extends BaseStatefulWidget {
  @override
  State<ProductInfoView> createState() => _ProductInfoViewState();
}

class _ProductInfoViewState
    extends BaseStatefulView<ProductInfoView, ProductInfoController> {
  @override
  Widget buildBody(BuildContext context) {
    //TODO REFACTOR
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(35, 35, 38, 1),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 450,
                flexibleSpace: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  child: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              initialPage: controller.activeImgIndex.value,
                              height: 450.0,
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              scrollDirection: Axis.vertical,
                              onPageChanged: (index, reason) {
                                controller.onIndexChanged(index);
                              }),
                          itemCount: controller.product!.photos.length,
                          itemBuilder: (context, index, realIndex) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: controller.product!.photos[index],
                              ),
                            );
                          },
                        ),
                        controller.product!.photos.length > 1 ?
                        Positioned(
                          top: 25,
                          right: 10,
                          child: AnimatedSmoothIndicator(
                            effect: const SwapEffect(
                              activeDotColor: Colors.white,
                              dotColor: Colors.black26,
                              dotWidth: 12,
                              dotHeight: 12,
                            ),
                            axisDirection: Axis.vertical,
                            activeIndex: controller.activeImgIndex.value,
                            count: controller.product!.photos.length,
                          ),
                        ) : const Offstage(),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PriceTag(
                                      price: controller.product?.price ?? ''),
                                  controller.isMineProduct.value == true
                                      ? IconButton(
                                          onPressed: () => Get.toNamed(
                                            Routes.ADD_PRODUCT,
                                            arguments: {
                                              'product': controller.product
                                            },
                                          ),
                                          icon: const Icon(
                                            KopaApp.edit,
                                            size: 35,
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () => controller.onChange(
                                              controller.isLiked.value,
                                              controller.product!.id),
                                          icon: Icon(
                                            Icons.favorite,
                                            size: 35,
                                            color:
                                                controller.isLiked.value == true
                                                    ? Colors.red
                                                    : Colors.white,
                                          ),
                                        )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.product?.model ?? '',
                                style: const TextStyle(
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: const SizeInfo(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Матеріал: ${controller.product?.material ?? ''}',
                                style: const TextStyle(
                                  color: Color(0xff9a9a9a),
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.product?.description ?? '',
                                style: const TextStyle(
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
                      ),
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromRGBO(35, 35, 38, 1),
                      child: controller.isMineProduct.value
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: MainButton(
                                  text: 'Видалити оголошення'.tr,
                                  onPressed: () => Get.dialog(
                                    CustomDialog(
                                      text:
                                          'Ви впевнені, що хочете видалити?'.tr,
                                      textConfirm: 'Так'.tr,
                                      textCancel: 'Ні'.tr,
                                      onConfirm: () =>
                                          controller.deleteProduct(),
                                      onCancel: () => Get.back(),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          imageUrl: controller.seller?.imgUrl ??
                                              'https://picsum.photos/200/300',
                                          width: 60,
                                          height: 60,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${controller.seller?.firstName} ${controller.seller?.lastName}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          controller.seller?.city ?? '',
                                          style: const TextStyle(
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
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SplashEffect.circular(
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
                                            color: Color.fromRGBO(35, 35, 38, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
