import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/auth/login_by_phone/utils/login_form_fields.dart';
import 'package:kopa_app/app/modules/auth/widgets/auth_title.dart';
import 'package:kopa_app/app/widgets/main_button.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';
import '../controllers/login_by_phone_controller.dart';


class LoginByPhoneView extends BaseStatefulWidget {
  @override
  State<LoginByPhoneView> createState() => _LoginByPhoneViewState();
}

class _LoginByPhoneViewState
    extends BaseStatefulView<LoginByPhoneView, LoginByPhoneController> {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Assets.images.logo.image(fit: BoxFit.fill),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const AuthTitle(),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      ObxValue<RxBool>((isShowCode) {
                        if (!isShowCode.value) {
                          return FormBuilderTextField(
                            key: Key(LoginFormFields.PHONE.toSimpleString()),
                            autofocus: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(9),
                            ],
                            name: LoginFormFields.PHONE.toSimpleString(),
                            style: const TextStyle(
                              color: Color.fromRGBO(188, 188, 188, 1),
                            ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Color.fromRGBO(255, 255, 255, 0.38),
                                ),
                              ),
                              prefix: const Text('+380'),
                              hintStyle: const TextStyle(
                                color: Color.fromRGBO(188, 188, 188, 1),
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Поле не повинне бути порожнім'.tr,
                              ),
                            ]),
                          );
                        }
                        return FormBuilderTextField(
                          key: Key(LoginFormFields.CODE.toSimpleString()),
                          obscureText: true,
                          autofocus: true,
                          name: LoginFormFields.CODE.toSimpleString(),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                          ],
                          style: const TextStyle(
                            color: Color.fromRGBO(188, 188, 188, 1),
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
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
                        );
                        // return
                      }, controller.isShowCode),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ObxValue<RxBool>((isShowCode) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: MainButton(
                    text: controller.isShowCode.value
                        ? 'Далі'.tr
                        : 'Верифікувати'.tr,
                    onPressed: controller.isShowCode.value
                        ? () => controller.submit()
                        : () => controller.verifyPhone(),
                  ),
                );
              }, controller.isShowCode)
            ],
          ),
        ],
      ),
    );
  }
}
