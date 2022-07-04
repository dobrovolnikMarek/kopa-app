import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class BaseController extends GetxController /*with ShowMessageMixin*/ {
  bool _contentProgress = false;
  bool get contentProgress => _contentProgress;

  bool _globalProgress = false;
  bool get globalProgress => _globalProgress;

  final RxBool _isError = RxBool(false);
  RxBool get isError => _isError;

  @protected
  void resetError() {
    if (_isError.isTrue) {
      _isError(false);
    }
  }

  @protected
  void showContentProgress() {
    _contentProgress = true;
    update();
  }

  @protected
  void hideContentProgress() {
    _contentProgress = false;
    update();
  }

  @protected
  void showProgress() {
    _globalProgress = true;
    update();
  }

  @protected
  void hideProgress() {
    _globalProgress = false;
    update();
  }

  @protected
  void handleError(Object err, StackTrace stackTrace) {
    if (_contentProgress) hideContentProgress();
    if (_globalProgress) hideProgress();
    _isError(true);
    // _onError(err, stackTrace);
  }

/*void _onError(dynamic e, StackTrace stackTrace) {
    if (e == null) return;
    if (e is ValidationException) {
      showMessageRes(e.stringResource);
    } else if (e is UnauthorizedException) {
      Get.offAllNamed(Routes.LOGIN);
      LogService().log(e, stackTrace);
    } else if (e is ForbiddenException) {
      showMessage(e.msg);
      LogService().log(e, stackTrace);
    } else if (e is NotFoundException) {
      showMessage(e.msg);
      LogService().log(e, stackTrace);
    } else if (e is BadRequestException) {
      showMessage(e.msg);
      LogService().log(e, stackTrace);
    } else if (e is InternalServerErrorException) {
      showMessage(e.msg);
      LogService().log(e, stackTrace);
    } else if (e is SocketException || e is ConnectionTimeoutException) {
      showMessageRes(noInternetError);
    } else {
      showMessageRes(unexpectedError);
      LogService().log(e, stackTrace);
    }
  }*/

}
