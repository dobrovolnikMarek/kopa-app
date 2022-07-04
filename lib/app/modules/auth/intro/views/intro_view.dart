import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kopa_app/app/core/states/view/base_stateful.view.dart';
import 'package:kopa_app/app/core/widgets/base_stateful.widget.dart';
import 'package:kopa_app/app/modules/auth/intro/widgets/auth_item.dart';
import 'package:kopa_app/app/modules/auth/widgets/auth_title.dart';
import 'package:kopa_app/app/routes/app_pages.dart';
import 'package:kopa_app/resources/gen/assets.gen.dart';
import 'package:kopa_app/resources/icons/kopa_app.dart';

import '../controllers/intro_controller.dart';

import 'package:flutter/material.dart';

class IntroView extends BaseStatefulWidget {
  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends BaseStatefulView<IntroView, IntroController> {
  @override
  Widget buildBody(BuildContext context) {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    // GoogleSignInAccount? _user;
    // GoogleSignInAccount get user => _user!;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Assets.images.logo.image(fit: BoxFit.fill),
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              const AuthTitle(),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AuthItem(
                    icon: KopaApp.phone,
                    color: Color(0xff42ff00),
                    tap: () => Get.toNamed(Routes.LOGIN_BY_PHONE),
                  ),
                  AuthItem(
                    icon: KopaApp.facebook,
                    color: Color(0xff43419b),
                    tap: () {},
                  ),
                  AuthItem(
                    icon: KopaApp.google,
                    color: Color(0xffff0000),
                    tap: () async {
                      final _user = await _googleSignIn.signIn();
                      if(_user == null) return;
                      final googleAuth = await _user.authentication;
                      final credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth.accessToken,
                          idToken: googleAuth.idToken
                      );
                      await FirebaseAuth.instance.signInWithCredential(credential);
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
