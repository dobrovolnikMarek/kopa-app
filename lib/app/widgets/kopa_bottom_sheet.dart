import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> showConfirmationBottomSheet<T>({
  required Widget layout,
  bool enableDrag = true,
  bool isDismissible = true,
  bool isScrollControlled = true,
}) async {
  return await Get.bottomSheet<T>(
    ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
      child: layout,
    ),
    backgroundColor: Colors.black26,
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    useRootNavigator: false,
    persistent: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
  );
}