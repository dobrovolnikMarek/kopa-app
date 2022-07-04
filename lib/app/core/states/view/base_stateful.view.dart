import 'package:flutter/material.dart';

import '../../getx/base.controller.dart';
import '../../widgets/base_stateful.widget.dart';
import '../state/base_controlled_state.dart';

abstract class BaseStatefulView<B extends BaseStatefulWidget,
    C extends BaseController> extends BaseControlledState<B, C> {
  BaseStatefulView({String? tag}) : super();

  @override
  Widget getLayout(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppbar(),
      body: buildBody(context),
      floatingActionButton: buildFab(),
      resizeToAvoidBottomInset: true,
    );
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
