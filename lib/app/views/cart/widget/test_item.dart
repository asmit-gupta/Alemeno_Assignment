import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/model/test_item_model.dart';
import 'package:alemeno_app/app/views/widgets/outlined_button.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestItem extends StatelessWidget {
  final LabTestController itemController = Get.find<LabTestController>();

  final LabTestModel labTest;
  TestItem({
    Key? key,
    required this.labTest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        2.0.sp,
      ),
      child: UnconstrainedBox(
        child: SizedBox(
          width: 85.0.wp,
          height: 48.0.wp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.5.wp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      4.0.sp,
                    ),
                    child: Text(
                      labTest.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      4.0.sp,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "₹ ${labTest.amount}",
                          style: TextStyle(
                            color: money,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          labTest.costPrice.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0.wp,
              ),
              CustomOutlinedButton(
                isCenter: false,
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: darkBlue,
                  size: 22,
                ),
                borderWidth: 1.5,
                text: "Remove",
                height: 4.5.hp,
                width: 35.0.wp,
                radius: 20,
                onTap: () {
                  itemController.removeItemFromCart(labTest);
                },
              ),
              CustomOutlinedButton(
                isCenter: false,
                icon: const Icon(
                  Icons.file_upload_outlined,
                  color: darkBlue,
                  size: 22,
                ),
                borderWidth: 1.5,
                text: "Upload prescription (optional)",
                height: 4.5.hp,
                width: 68.0.wp,
                radius: 20,
              ),
              const Divider(
                thickness: 1.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
