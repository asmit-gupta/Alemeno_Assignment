import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/model/test_item_model.dart';
import 'package:alemeno_app/app/views/widgets/outlined_button.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/app/views/widgets/button.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:alemeno_app/core/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallCard extends StatelessWidget {
  final LabTestController controller = Get.find<LabTestController>();
  final LabTestModel labTest;

  SmallCard({Key? key, required this.labTest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardWidth = Get.width - 12.0.wp;
    var cardHeight = Get.height - 40.0.hp;

    // Check if the labTest is in the cart
    bool isInCart = controller.cartList.contains(labTest);

    return Padding(
      padding: EdgeInsets.only(
        right: 2.0.wp,
        left: 2.0.wp,
        bottom: 2.0.wp,
      ),
      child: Container(
        width: cardWidth / 1.9,
        height: cardHeight / 2,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    8.0,
                  ),
                  topRight: Radius.circular(
                    8.0,
                  ),
                ),
              ),
              height: 5.5.hp,
              width: double.infinity,
              child: Center(
                child: Text(
                  labTest.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 1.0,
            ),
            Padding(
              padding: EdgeInsets.all(1.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Includes ${labTest.tests} tests',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12.0.sp,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      imagePath1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.wp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.0.wp,
              ),
              child: Text(
                'Get reports in ${labTest.hours} hours',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 10.0.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.0.wp,
                vertical: 1.0.wp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "₹ ",
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 12.0.sp,
                    ),
                  ),
                  Text(
                    labTest.amount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                      fontSize: 12.0.sp,
                    ),
                  ),
                  SizedBox(
                    width: 4.0.wp,
                  ),
                  Text(
                    labTest.costPrice.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 10.0.sp,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.7.wp,
            ),
            Center(
              child: Obx(
                () => Button(
                  onTap: () {
                    controller.addItemInCart(labTest);
                    print(controller.cartList.length);
                  },
                  color:
                      controller.cartList.contains(labTest) ? money : darkBlue,
                  text: controller.cartList.contains(labTest)
                      ? 'Added to cart'
                      : 'Add to cart',
                  height: 5.0.hp,
                  width: 38.0.wp,
                ),
              ),
            ),
            Center(
              child: CustomOutlinedButton(
                isCenter: true,
                text: 'View Details',
                height: 4.8.hp,
                width: 38.0.wp,
                radius: 10.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
