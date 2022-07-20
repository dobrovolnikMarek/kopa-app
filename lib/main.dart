import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kopa_app/app/dependency_injection/global_bindings.dart';
import 'package:kopa_app/core_app.dart';

final GlobalBinding globalBinding = GlobalBinding(Flavor.DEV);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Future<void> run() async {
    var app = CoreApp();
    runApp(app);
  }

  if (kReleaseMode) {
    runZoned(run);
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // runZonedGuarded<Future<void>>(
    //     run, FirebaseCrashlytics.instance.recordError);
  } else {
    runZoned(run);
  }
}

