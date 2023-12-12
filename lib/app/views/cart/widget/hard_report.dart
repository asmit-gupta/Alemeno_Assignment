import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class HardReport extends StatefulWidget {
  const HardReport({Key? key});

  @override
  State<HardReport> createState() => _HardReportState();
}

class _HardReportState extends State<HardReport> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 18.0.hp,
        width: 90.0.wp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  icon: isChecked
                      ? const Icon(
                          Icons.check_circle_rounded,
                          size: 20,
                          color: darkBlue,
                        )
                      : const Icon(
                          Icons.circle_outlined,
                          size: 20,
                        ),
                ),
                Text(
                  'Hard copy of reports',
                  style: TextStyle(color: Colors.black, fontSize: 11.0.sp),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.0.sp),
              child: Text(
                "Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.",
                style:
                    TextStyle(color: Colors.grey.shade700, fontSize: 11.0.sp),
              ),
            ),
            SizedBox(
              height: 2.0.hp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.0.sp),
              child: Text(
                '₹150 per person',
                style:
                    TextStyle(color: Colors.grey.shade700, fontSize: 11.0.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
