import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/views/cart/widget/amount_card.dart';
import 'package:alemeno_app/app/views/cart/widget/hard_report.dart';
import 'package:alemeno_app/app/views/cart/widget/schedule_card.dart';
import 'package:alemeno_app/app/views/cart/widget/test_review_card.dart';
import 'package:alemeno_app/app/views/success/view.dart';
import 'package:alemeno_app/app/views/widgets/button.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  LabTestController controller = Get.find<LabTestController>();
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'My cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0.sp,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              controller.hardCopy.value = false;
              controller.date.value = '';
              controller.time.value = '';
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          PopupMenuButton(
            color: Colors.blue,
            itemBuilder: (context) {
              return const [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 12.0.hp,
          width: double.infinity,
          color: backgroundColor,
          child: UnconstrainedBox(
            child: Obx(
              () => Button(
                color: controller.cartList.length > 0 &&
                        (controller.date.value != '' &&
                            controller.time.value != '')
                    ? darkBlue
                    : Colors.grey,
                text: 'Schedule',
                height: 7.0.hp,
                width: 90.0.wp,
                onTap: controller.cartList.length > 0 &&
                        (controller.date.value != '' &&
                            controller.time.value != '')
                    ? () {
                        Get.to(() => SuccessPage());
                      }
                    : controller.cartList.length == 0
                        ? () {
                            Get.snackbar(
                              'Cart empty',
                              'Add some test to checkout',
                              backgroundColor: lightBlue,
                              colorText: Colors.white,
                            );
                          }
                        : () {
                            Get.snackbar(
                              'Date not specified',
                              'Schedule your appointment',
                              backgroundColor: lightBlue,
                              colorText: Colors.white,
                            );
                          },
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 1.8.wp,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.sp,
            ),
            child: Text(
              'Order review', //TODO: use get strings.
              style: TextStyle(
                color: darkBlue,
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 8.0.sp,
          ),
          TestReviewCard(),
          SizedBox(
            height: 12.0.sp,
          ),
          ScheduleCard(),
          SizedBox(
            height: 12.0.sp,
          ),
          AmountCard(),
          SizedBox(
            height: 12.0.sp,
          ),
          const HardReport(),
        ],
      ),
    );
  }
}
