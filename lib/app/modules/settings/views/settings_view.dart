import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/widgets/custom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends BaseStatefulWidget {
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends BaseStatefulView<SettingsView, SettingsController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -10,
                        child: SizedBox(
                          width: Get.width,
                          height: 50,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: Colors.transparent
                              // color: Colors.red
                            ),
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Obx(() {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: controller.imageFile == null
                                ? CachedNetworkImage(
                              imageUrl: 'https://picsum.photos/200/300',
                              width: 90,
                              height: 90,
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
                            )
                                : SizedBox(
                              width: 90,
                              height: 90,
                              child: CircleAvatar(
                                backgroundImage: controller.imageFile ==
                                    null
                                    ? null
                                    : FileImage(
                                  File(controller.imageFile!.path),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(12, 205, 230, 1),
                            ),
                            child: IconButton(
                              onPressed: () => controller.takePicture(),
                              icon: const Icon(
                                Icons.add,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'Angela Mayer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            FormBuilder(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Контактний номер'.tr),
                  FormBuilderTextField(
                    enabled: false,
                    name: "phone",
                    style: const TextStyle(
                      color: Color.fromRGBO(188, 188, 188, 1),
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Color.fromRGBO(255, 255, 255, 0.38),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Місто'.tr,
                  ),
                  FormBuilderTextField(
                    enabled: false,
                    name: "phone",
                    style: const TextStyle(
                      color: Color.fromRGBO(188, 188, 188, 1),
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Color.fromRGBO(171, 180, 189, 0.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MainButton(
              text: 'Вийти'.tr,
              width: 283,
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(
        index: 4,
      ),
    );
  }
}

