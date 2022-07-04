import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback? onPressed;

  const MainButton({
    Key? key,
    required this.text,
    this.onPressed, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromRGBO(12, 205, 230, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        minimumSize: Size(
        width ?? MediaQuery.of(context).size.width,
          50,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
