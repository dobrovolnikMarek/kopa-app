import 'package:get/get.dart';
import 'package:kopa_app/app/core/getx/base.controller.dart';

class HomeController extends BaseController {
  //TODO: Implement HomeController
  final liked = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChange(val){
    liked.value = !val;
  }
}
