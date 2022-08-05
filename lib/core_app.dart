import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:kopa_app/main.dart';
import 'package:kopa_app/resources/theme/theme.dart';

import 'routes/app_pages.dart';

/// widget of app and its configuration
class CoreApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CoreAppState();
  }
}

class CoreAppState extends State<CoreApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        Get.locale = Localizations.localeOf(context);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1, devicePixelRatio: window.devicePixelRatio),
          child: child ?? const Offstage(),
        );
      },
      // transitionDuration: AppPages.transitionDuration,
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      /*supportedLocales: Localization.getSupportedLocales(),
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale?.languageCode)
            return supportedLocaleLanguage;
        }

        // If device not support with locale to get language code then default get first on from the list
        return supportedLocales.first;
      },*/
      title: 'Kopa',
      theme: Themes.darkTheme,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      unknownRoute: AppPages.UNKNOWN,
      // initialBinding: SplashBinding(),
      initialBinding: globalBinding,
    );
  }
}
