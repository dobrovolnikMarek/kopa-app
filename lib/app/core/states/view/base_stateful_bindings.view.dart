import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopa_app/app/core/states/state/base_controlled_bindings_state.dart';

import '../../getx/base.controller.dart';
import '../../widgets/base_stateful.widget.dart';

abstract class BaseStatefulBindingsView<
    B extends BaseStatefulWidget,
    C extends BaseController,
    BI extends Bindings> extends BaseControlledBindingsState<B, BI, C> {
  BaseStatefulBindingsView({String? tag, required BI bindings})
      : super(bindings: bindings);

  @override
  Widget getLayout(BuildContext context) {
    return buildBody(
      context,
    ); /*Scaffold(
      key: scaffoldKey,
      appBar: buildAppbar(),
      body: buildBody(context),
      floatingActionButton: buildFab(),
      resizeToAvoidBottomInset: true,
    );*/
  }

  /// should be overridden in extended widget
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// should be overridden in extended widget
  Widget buildBody(BuildContext context);

  Widget? buildFab() {
    return null;
  }
}
