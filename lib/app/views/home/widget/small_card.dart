import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/model/test_item_model.dart';
import 'package:alemeno_app/app/views/widgets/outlined_button.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/app/views/widgets/button.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:alemeno_app/core/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallCard extends StatefulWidget {
  final LabTestModel labTest;

  SmallCard({Key? key, required this.labTest}) : super(key: key);

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  final LabTestController controller = Get.find<LabTestController>();

  bool isAddingToCart = false;

  @override
  Widget build(BuildContext context) {
    var cardWidth = Get.width - 12.0.wp;
    var cardHeight = Get.height - 40.0.hp;

    return Padding(
      padding: EdgeInsets.only(
        right: 2.0.wp,
        left: 2.0.wp,
        bottom: 0.0.wp,
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
              height: 5.0.hp,
              width: double.infinity,
              child: Center(
                child: Text(
                  widget.labTest.title,
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
                    'Includes ${widget.labTest.tests} tests',
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
                'Get reports in ${widget.labTest.hours} hours',
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
                    widget.labTest.amount.toString(),
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
                    widget.labTest.costPrice.toString(),
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
                    if (!controller.cartList.contains(widget.labTest) &&
                        !isAddingToCart) {
                      setState(() {
                        isAddingToCart = true;
                      });

                      controller.addItemInCart(widget.labTest);
                      print(controller.cartList.length);

                      Future.delayed(
                        const Duration(
                          milliseconds: 600,
                        ),
                        () {
                          setState(() {
                            isAddingToCart = false;
                          });
                        },
                      );
                    }
                  },
                  color: isAddingToCart
                      ? Colors.grey
                      : controller.cartList.contains(widget.labTest)
                          ? money
                          : darkBlue,
                  text: isAddingToCart
                      ? 'Adding to cart'
                      : controller.cartList.contains(widget.labTest)
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
