import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';

Widget getProgress({bool wrap = false, bool background = true}) {
  if (wrap) {
    return Center(
      heightFactor: 0,
      child: CircularProgressIndicator(),
    );
  }
  return Stack(
    children: [
      if (background)
        Container(
          color: Color.fromARGB(160, 0, 0, 0),
        )
      else
        const SizedBox.shrink(),
      Center(
        child: CircularProgressIndicator(),
      )
    ],
  );
}

// TODO: maybe custom dialog?
void showAlert(BuildContext context, String title, String msg, Function onOk,
    {Function? onCancel, String? okButtonTitle, String? cancelButtonTitle}) {
  if (kIsWeb || Platform.isAndroid) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            title,
          ),
          content: Text(
            msg,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(
                cancelButtonTitle ?? 'buttons_cancel'.tr,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancel != null) {
                  onCancel();
                }
              },
            ),
            TextButton(
              child: Text(
                okButtonTitle ?? 'buttons_ok'.tr,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onOk();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          CupertinoDialogAction(
            child: Text(cancelButtonTitle ?? 'buttons_cancel'.tr),
            onPressed: () {
              Navigator.of(context).pop();
              if (onCancel != null) {
                onCancel();
              }
            },
          ),
          CupertinoDialogAction(
            child: Text(okButtonTitle ?? 'buttons_ok'.tr),
            onPressed: () {
              Navigator.of(context).pop();
              onOk();
            },
          )
        ],
      ),
    );
  }
}

/*AppBar getAppBar(BuildContext context, String title,
    {Widget? leading,
    List<Widget>? actions,
    Color? backgroundColor = colorPrimary}) {
  return AppBar(
    elevation: 0.0,
    leading: leading,
    centerTitle: false,
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 20, color: colorWhiteText),
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
    actions: actions,
  );
}*/
