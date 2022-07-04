import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;
  const PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: const Color(0xffffd600),
      ),
      child: Center(
        child: Text('${price}\$', style: const TextStyle(
          color: Color(0xff434343),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),),
      ),
    );
  }
}
