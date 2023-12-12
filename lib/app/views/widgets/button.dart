import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final double height;
  final double width;
  Function? onTap;
  Button({
    super.key,
    required this.color,
    required this.text,
    required this.height,
    required this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: EdgeInsets.all(
          3.0.sp,
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
