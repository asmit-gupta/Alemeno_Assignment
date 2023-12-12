import 'package:alemeno_app/app/views/widgets/outlined_button.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:alemeno_app/core/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullCard extends StatelessWidget {
  final String title;
  final int tests;
  final String detail1;
  final String detail2;
  final int amount;
  const FullCard({
    super.key,
    required this.title,
    required this.tests,
    required this.detail1,
    required this.detail2,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    return Padding(
      padding: EdgeInsets.all(6.0.sp),
      child: UnconstrainedBox(
        child: Container(
          height: 43.0.hp,
          width: width * 0.9,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 14.0.hp,
                decoration: const BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 20,
                      ),
                      child: Image.asset(icon1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 25,
                        top: 5,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 65,
                          width: 80,
                          child: Image.asset(
                            imagePath2,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 2.0.wp,
                  left: 5.0.wp,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 3.0.wp,
                  left: 5.0.wp,
                ),
                child: Text(
                  'Includes $tests tests',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12.0.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 1.0.wp,
                  left: 6.8.wp,
                ),
                child: Text(
                  '$bullet $detail1',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12.0.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 1.0.wp,
                  left: 6.8.wp,
                ),
                child: Text(
                  '$bullet $detail2',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12.0.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 5.0.wp,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View more',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0.wp,
                  vertical: 2.0.wp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ $amount/-",
                      style: TextStyle(
                        color: money,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomOutlinedButton(
                      text: 'Add to Cart',
                      isCenter: true,
                      height: 10.0.wp,
                      width: 32.0.wp,
                      radius: 8.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/* 
IMPORTANT NOTE: I haven't added data in this card dynamically since the skill it would 
present to you is already shown in the grid used in smallcard(or, data being fetched 
from DB and dynamically being shown in the grid). Though That can also be 
easily implemented here. All the buttons are dummy in this and thus, are non-functional.
*/