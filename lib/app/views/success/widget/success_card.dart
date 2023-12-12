import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/utils/consts.dart';
import 'package:flutter/material.dart';

class SuccessCard extends StatelessWidget {
  final String date;
  final String time;
  const SuccessCard({super.key, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.hp,
      width: 90.0.wp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.0.hp,
          ),
          SizedBox(
            height: 50.0.wp,
            width: 50.0.wp,
            child: Image.asset(
              successImage,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Text(
            "Lab tests have been\nscheduled successfully, You\nwill receive a mail of the same.",
            style: TextStyle(color: Colors.black, fontSize: 14.0.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 3.0.hp,
          ),
          Text(
            "$date | $time",
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14.0.sp),
          ),
        ],
      ),
    );
  }
}
