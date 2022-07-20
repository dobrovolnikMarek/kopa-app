import 'package:flutter/material.dart';

class CustomTextLabel extends StatelessWidget {
  final String title;
  const CustomTextLabel({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff0ccde6),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
