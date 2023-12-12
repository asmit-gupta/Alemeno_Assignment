import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double radius;
  final Icon? icon;
  final double? borderWidth;
  final bool isCenter;
  final Color? color;
  final Color? textColor;
  final bool? isPadding;
  Function? onTap;
  CustomOutlinedButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.radius,
    this.icon,
    this.borderWidth,
    required this.isCenter,
    this.color,
    this.isPadding,
    this.textColor,
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              radius,
            ),
            border: Border.all(
              width: borderWidth != null ? borderWidth! : 1.0,
              color: color ?? darkBlue,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment:
                  isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                icon != null
                    ? SizedBox(
                        width: 14.0.sp,
                      )
                    : const SizedBox(
                        width: 0.0,
                      ),
                icon != null ? icon! : const Text(''),
                icon != null
                    ? SizedBox(
                        width: 8.0.sp,
                      )
                    : const SizedBox(
                        width: 0.0,
                      ),
                Padding(
                  padding: isPadding != null
                      ? EdgeInsets.all(
                          4.0.sp,
                        )
                      : const EdgeInsets.all(0.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor ?? darkBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
