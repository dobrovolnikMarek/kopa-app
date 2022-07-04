import 'dart:io';

import 'package:logger/logger.dart';

Logger getLogger() {
  final printer = PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 10,
    printTime: false,
    colors: !Platform.isIOS,
    lineLength: 120,
    printEmojis: true,
  );

  return Logger(
    printer: Platform.isIOS
        ? PrefixPrinter(
            printer,
          )
        : printer,
  );
}

final logger = getLogger();
