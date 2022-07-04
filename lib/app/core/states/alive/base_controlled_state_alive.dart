import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../getx/base.controller.dart';
import '../../utils/utils.dart';
import '../../widgets/base_stateful.widget.dart';
import '../state/base_controlled_state.dart';

abstract class BaseControlledStateAlive<B extends BaseStatefulWidget,
        C extends BaseController> extends BaseControlledState<B, C>
    with AutomaticKeepAliveClientMixin {
  BaseControlledStateAlive({String? tag}) : super();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<C>(
      tag: tag,
      builder: (_) {
        if (controller.globalProgress) {
          return Stack(
            children: [
              getLayout(context),
              getProgress(),
            ],
          );
        }
        return getLayout(context);
      },
    );
  }
}
