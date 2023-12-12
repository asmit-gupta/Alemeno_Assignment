import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/model/test_item_model.dart';
import 'package:alemeno_app/app/views/cart/widget/amount_line.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmountCard extends StatelessWidget {
  LabTestController controller = Get.find<LabTestController>();
  AmountCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 21.0.hp,
        width: 90.0.wp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 2.5.hp,
              ),
              AmountLine(
                title: 'M.R.P Total',
                number: controller.calculateTotalMRP(),
                color: Colors.grey.shade700,
              ),
              SizedBox(
                height: 0.9.hp,
              ),
              AmountLine(
                title: 'Discount',
                number: controller.calculateDiscount(),
                color: Colors.grey.shade700,
              ),
              SizedBox(
                height: 4.0.hp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount to be paid',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 13.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\₹ ${controller.calculateTotalAmount()}/-',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 13.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.0.hp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 26.0.sp,
                ),
                child: Row(
                  children: [
                    Text(
                      'Total savings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.0.sp,
                      ),
                    ),
                    SizedBox(
                      width: 16.0.sp,
                    ),
                    Text(
                      '₹ ${controller.calculateDiscount()}/-',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 13.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
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
