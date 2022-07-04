import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/base.controller.dart';
import '../../utils/utils.dart';
import '../../widgets/base_stateful.widget.dart';
import 'base_state.dart';

abstract class BaseControlledBindingsState<B extends BaseStatefulWidget,
    BI extends Bindings, C extends BaseController> extends BaseState<B> {
  final String? tag = null;

  late final C controller;
  final BI bindings;

  // C get controller => GetInstance().find<C>(tag: tag);
  BaseControlledBindingsState({required this.bindings});

  @override
  void initState() {
    Bindings? b = bindings;
    b.dependencies();
    controller = GetInstance().find<C>(tag: tag);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<C>(
      tag: tag,
      builder: (_) {
        if (controller.globalProgress) {
          return WillPopScope(
            onWillPop: () async {
              //TODO: timeout for seconds
              final shouldPopScope = true;
              return shouldPopScope;
            },
            child: Stack(
              children: <Widget>[
                getLayout(context),
                getProgress(),
              ],
            ),
          );
        }
        return getLayout(context);
      },
    );
  }
}
