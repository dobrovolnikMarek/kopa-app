import 'package:flutter/material.dart';
import 'package:kopa_app/app/widgets/splash_effect.dart';

class AuthItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback tap;

  const AuthItem(
      {Key? key, required this.color, required this.icon, required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashEffect.circular(
      onTap: tap,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 42.79,
              offset: Offset(0, 4),
            ),
          ],
          color: color,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
