import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin ShowMessageMixin {
  void showMessageResM(BuildContext? context, Map<String, String> msgRes) {
    if (context == null) return;
    // return showMessageM(Localization.of(context)?.getValue(msgRes));
  }

  /// Shows message: toast on android or alert dialog on ios
  void showMessageM(String? message) {
    if (message == null) {
      return;
    }
    /*Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black87,
        fontSize: 14.0);*/
  }
}
