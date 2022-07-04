import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/auth/widgets/auth_title.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

import '../controllers/sign_up_controller.dart';

import 'package:flutter/material.dart';

class SignUpView extends BaseStatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseStatefulView<SignUpView, SignUpController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const AuthTitle(),
                const SizedBox(
                  height: 40,
                ),
                FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: "name",
                        style: const TextStyle(
                          color: Color.fromRGBO(188, 188, 188, 1),
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text('Ім’я'.tr),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(255, 255, 255, 0.38),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(188, 188, 188, 1),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Поле не повинне бути порожнім або містити цифри'.tr,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      FormBuilderTextField(
                        name: "surname",
                        style: const TextStyle(
                          color: Color.fromRGBO(188, 188, 188, 1),
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text('Прізвище'.tr),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(255, 255, 255, 0.38),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(188, 188, 188, 1),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Поле не повинне бути порожнім або містити цифри'.tr,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      FormBuilderTextField(
                        name: "city",
                        style: const TextStyle(
                          color: Color.fromRGBO(188, 188, 188, 1),
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text('Місто'.tr),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(255, 255, 255, 0.38),
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(188, 188, 188, 1),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Поле не повинне бути порожнім'.tr,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              child: MainButton(
                text: 'Готово'.tr,
                onPressed: () => controller.submit(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

