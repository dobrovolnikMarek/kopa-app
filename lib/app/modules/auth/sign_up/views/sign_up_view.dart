import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/auth/sign_up/utils/sign_up_form_fields.dart';
import 'package:kopa_app/app/modules/auth/widgets/auth_title.dart';
import 'package:kopa_app/app/widgets/main_button.dart';

import '../controllers/sign_up_controller.dart';


class SignUpView extends BaseStatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends BaseStatefulView<SignUpView, SignUpController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: AuthTitle(),
                    ),
                    FormBuilder(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            key: Key(SignUpFormFields.FIRSTNAME.toSimpleString()),
                            name: SignUpFormFields.FIRSTNAME.toSimpleString(),
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
                                errorText: 'Поле не повинне бути порожнім'.tr,
                              ),
                              (value) {
                                if (value!.contains(RegExp(r'[0-9]'))) {
                                  return 'Поле не повинно містити цифр';
                                }
                                return null;
                              },
                            ]),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          FormBuilderTextField(
                            key: Key(SignUpFormFields.LASTNAME.toSimpleString()),
                            name: SignUpFormFields.LASTNAME.toSimpleString(),
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
                                errorText: 'Поле не повинне бути порожнім'.tr,
                              ),
                              (value) {
                                if (value!.contains(RegExp(r'[0-9]'))) {
                                  return 'Поле не повинно містити цифр';
                                }
                                return null;
                              },
                            ]),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          FormBuilderTextField(
                            key: Key(SignUpFormFields.CITY.toSimpleString()),
                            name: SignUpFormFields.CITY.toSimpleString(),
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
                              (value) {
                                if (value!.contains(RegExp(r'[0-9]'))) {
                                  return 'Поле не повинно містити цифр';
                                }
                                return null;
                              },
                            ]),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          FormBuilderTextField(
                            key: Key(SignUpFormFields.PHONE.toSimpleString()),
                            name: SignUpFormFields.PHONE.toSimpleString(),
                            style: const TextStyle(
                              color: Color.fromRGBO(188, 188, 188, 1),
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: Text('Номер телефону'.tr),
                              prefixText: '+380',
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
                const SizedBox(
                  height: 25,
                ),
                MainButton(
                  text: 'Готово'.tr,
                  onPressed: () => controller.submit(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
