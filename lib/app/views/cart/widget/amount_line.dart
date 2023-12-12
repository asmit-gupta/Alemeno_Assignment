import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:flutter/material.dart';

class AmountLine extends StatelessWidget {
  final String title;
  final String number;
  final Color color;

  const AmountLine({
    super.key,
    required this.title,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
            ),
          ),
          Text(
            number.toString(),
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
