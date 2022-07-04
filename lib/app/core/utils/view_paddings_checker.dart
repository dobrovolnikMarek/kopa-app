import 'package:flutter/cupertino.dart';

class ViewPaddingsChecker {
  static bool haveBottomPadding(BuildContext context) =>
      MediaQuery.of(context).viewPadding.bottom > 0;

  static bool haveTopPadding(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top > 0;
}
