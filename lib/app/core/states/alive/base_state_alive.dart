import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../mixins/show_message_mixin.dart';
import '../../widgets/base_stateful.widget.dart';
import '../state/base_state.dart';

abstract class BaseStateAlive<B extends BaseStatefulWidget> extends BaseState<B>
    with ShowMessageMixin, AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getLayout(context);
  }
}
