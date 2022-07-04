import 'package:flutter/material.dart';

class SplashEffect extends StatelessWidget {
  final double? topRightRadius,
      bottomRightRadius,
      topLeftRadius,
      bottomLeftRadius;
  final Color? highlightColor;
  final Widget child;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final Border? border;
  final Color? color;
  final Gradient? backgroundGradient;

  const SplashEffect({
    Key? key,
    required this.child,
    this.onTap,
    this.highlightColor,
    this.boxShadow,
    this.color = Colors.transparent,
    this.border,
    this.backgroundGradient,
  })  : topLeftRadius = 0,
        topRightRadius = 0,
        bottomRightRadius = 0,
        bottomLeftRadius = 0,
        super(key: key);

  const SplashEffect.all(
      double? radius, {
        Key? key,
        required this.child,
        this.onTap,
        this.highlightColor,
        this.boxShadow,
        this.color = Colors.transparent,
        this.border,
        this.backgroundGradient,
      })  : topLeftRadius = radius,
        topRightRadius = radius,
        bottomRightRadius = radius,
        bottomLeftRadius = radius,
        super(key: key);

  const SplashEffect.vertical({
    Key? key,
    double? topRadius,
    double? bottomRadius,
    required this.child,
    this.onTap,
    this.highlightColor,
    this.boxShadow,
    this.color = Colors.transparent,
    this.border,
    this.backgroundGradient,
  })  : topLeftRadius = topRadius,
        topRightRadius = topRadius,
        bottomRightRadius = bottomRadius,
        bottomLeftRadius = bottomRadius,
        super(key: key);

  const SplashEffect.only({
    Key? key,
    double? leftRadius,
    double? rightRadius,
    required this.child,
    this.onTap,
    this.highlightColor,
    this.boxShadow,
    this.color = Colors.transparent,
    this.border,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    this.backgroundGradient,
  }) : super(key: key);

  const SplashEffect.horizontal({
    Key? key,
    double? leftRadius,
    double? rightRadius,
    required this.child,
    this.onTap,
    this.highlightColor,
    this.boxShadow,
    this.color = Colors.transparent,
    this.border,
    this.backgroundGradient,
  })  : topLeftRadius = leftRadius,
        topRightRadius = rightRadius,
        bottomRightRadius = rightRadius,
        bottomLeftRadius = leftRadius,
        super(key: key);

  const SplashEffect.circular({
    Key? key,
    double? leftRadius,
    double? rightRadius,
    required this.child,
    this.onTap,
    this.highlightColor,
    this.boxShadow,
    this.color = Colors.transparent,
    this.border,
    this.backgroundGradient,
  })  : topLeftRadius = 10,
        topRightRadius = 10,
        bottomRightRadius = 10,
        bottomLeftRadius = 10,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius ?? 0),
          topRight: Radius.circular(topRightRadius ?? 0),
          bottomRight: Radius.circular(bottomRightRadius ?? 0),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
        ),
        color: color,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius ?? 0),
            topRight: Radius.circular(topRightRadius ?? 0),
            bottomRight: Radius.circular(bottomRightRadius ?? 0),
            bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: border != null ? border!.bottom.width : 0,
              top: border != null ? border!.top.width : 0,
              right: border != null ? border!.right.width : 0,
              left: border != null ? border!.left.width : 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius ?? 0),
                topRight: Radius.circular(topRightRadius ?? 0),
                bottomRight: Radius.circular(bottomRightRadius ?? 0),
                bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
              ),
              highlightColor: highlightColor,
              splashColor: onTap != null
                  ? Theme.of(context).splashColor
                  : Colors.transparent,
              onTap: onTap,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
