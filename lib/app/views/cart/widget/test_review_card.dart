import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/views/cart/widget/test_item.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestReviewCard extends StatelessWidget {
  final LabTestController cartController = Get.find<LabTestController>();
  TestReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 90.0.wp,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Pathology Test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartController.cartList.length,
                itemBuilder: (context, index) {
                  final labTest = cartController.cartList[index];
                  return TestItem(labTest: labTest);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
