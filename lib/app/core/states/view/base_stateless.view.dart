import 'package:flutter/material.dart';

import '../../widgets/base_stateless.widget.dart';

abstract class BaseStatelessView extends BaseStatelessWidget {
  BaseStatelessView({Key? key}) : super(key: key);

  @override
  Widget getLayout(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(context),
        body: buildBody(context),
      ),
    );
  }

  /// should be overridden in extended widget
  PreferredSizeWidget? buildAppbar(BuildContext context);

  /// should be overridden in extended widget
  Widget buildBody(BuildContext context);
}
