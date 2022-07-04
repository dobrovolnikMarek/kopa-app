import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SnackbarHelper {
  static void showErrorSnackbar(
      {String? message, String? title, Duration? duration}) {
    SnackbarHelper.showSnackbar(
      title ?? 'statuses_error_'.tr,
      message ?? 'statuses_error_message'.tr,
      isDismissible: true,
      dismissDirection: DismissDirection.vertical,
      colorText: Colors.white,
      backgroundColor: Colors.red.withOpacity(0.8),
      backgroundGradient: const LinearGradient(
        begin: Alignment(0.7, 0.7),
        end: Alignment.center,
        colors: [Color(0xffcd2b3e), Color(0xff161617)],
      ),
      overlayBlur: 0,
      overlayColor: Colors.black,
    );
  }

  static void showSuccessSnackbar(
      {String? message, String? title, Duration? duration}) {
    SnackbarHelper.showSnackbar(
      title ?? 'statuses_success_'.tr,
      message ?? 'statuses_success_message'.tr,
      isDismissible: true,
      dismissDirection: DismissDirection.vertical,
      colorText: Colors.white,
      backgroundColor: Colors.red.withOpacity(0.5),
      backgroundGradient: const LinearGradient(
        begin: Alignment(0.7, 0.7),
        end: Alignment.center,
        colors: [Color(0xff00b007), Color(0xff161617)],
      ),
      overlayBlur: 0,
      overlayColor: Colors.black,
    );
  }

  static void showWarningSnackbar(
      {required String message, String? title, Duration? duration}) {
    SnackbarHelper.showSnackbar(
      title ?? 'statuses_warning_'.tr,
      message,
      isDismissible: true,
      dismissDirection: DismissDirection.vertical,
      colorText: Colors.white,
      backgroundColor: Colors.red.withOpacity(0.5),
      backgroundGradient: const LinearGradient(
        begin: Alignment(0.7, 0.7),
        end: Alignment.center,
        colors: [Color(0xffddc600), Color(0xff000000)],
      ),
      duration: duration,
      overlayBlur: 0,
      overlayColor: Colors.black,
    );
  }

  static void showSnackbar(
    String title,
    String message, {
    Color? colorText,
    Duration? duration = const Duration(seconds: 3),
    bool instantInit = true,
    SnackPosition? snackPosition,
    Widget? titleText,
    Widget? messageText,
    Widget? icon,
    bool? shouldIconPulse,
    double? maxWidth,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Color? backgroundColor,
    Color? leftBarIndicatorColor,
    List<BoxShadow>? boxShadows,
    Gradient? backgroundGradient,
    TextButton? mainButton,
    void Function(GetSnackBar)? onTap,
    bool? isDismissible = true,
    bool? showProgressIndicator,
    DismissDirection? dismissDirection = DismissDirection.up,
    AnimationController? progressIndicatorController,
    Color? progressIndicatorBackgroundColor,
    Animation<Color>? progressIndicatorValueColor,
    SnackStyle? snackStyle,
    Curve? forwardAnimationCurve,
    Curve? reverseAnimationCurve,
    Duration? animationDuration,
    double? barBlur,
    double? overlayBlur,
    void Function(SnackbarStatus?)? snackbarStatus,
    Color? overlayColor,
    Form? userInputForm,
  }) {
    Get.snackbar(
      title,
      message,
      colorText: colorText,
      duration: duration,
      instantInit: instantInit,
      snackPosition: snackPosition,
      titleText: titleText,
      messageText: messageText,
      icon: icon,
      shouldIconPulse: shouldIconPulse,
      maxWidth: maxWidth,
      margin: margin,
      padding: padding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      leftBarIndicatorColor: leftBarIndicatorColor,
      boxShadows: boxShadows,
      backgroundGradient: backgroundGradient,
      mainButton: mainButton,
      onTap: onTap,
      isDismissible: isDismissible,
      showProgressIndicator: showProgressIndicator,
      dismissDirection: dismissDirection,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      progressIndicatorValueColor: progressIndicatorValueColor,
      snackStyle: snackStyle,
      forwardAnimationCurve: forwardAnimationCurve,
      reverseAnimationCurve: reverseAnimationCurve,
      animationDuration: animationDuration,
      barBlur: barBlur,
      overlayBlur: overlayBlur,
      snackbarStatus: snackbarStatus,
      overlayColor: overlayColor,
      userInputForm: userInputForm,
    );
  }
}
