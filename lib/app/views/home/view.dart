import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/views/cart/view.dart';
import 'package:alemeno_app/app/views/home/widget/full_card.dart';
import 'package:alemeno_app/app/views/home/widget/small_card.dart';
import 'package:badges/badges.dart' as badge;
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final LabTestController labTestController = Get.put(LabTestController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 260) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Logo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0.sp,
          ),
        ),
        actions: [
          Obx(() {
            final cartCount = labTestController.cartList.length;
            return cartCount > 0
                ? Padding(
                    padding: EdgeInsets.only(
                      right: 1.0.sp,
                      top: 3.5.sp,
                    ),
                    child: badge.Badge(
                      badgeStyle: const BadgeStyle(
                        badgeColor: money,
                      ),
                      badgeContent: Text(
                        cartCount.toString(),
                        style: const TextStyle(
                          color: darkBlue,
                        ),
                      ),
                      position: BadgePosition.custom(top: 9, start: -6),
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => CartPage());
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: darkBlue,
                          size: 26,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      right: 1.0.sp,
                      top: 3.0.sp,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.to(() => CartPage());
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: darkBlue,
                        size: 26,
                      ),
                    ),
                  );
          }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 1.0.wp,
            left: 1.0.wp,
            top: 1.0.wp,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 2.0.wp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.0.sp,
                    ),
                    child: Text(
                      'Popular lab tests',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 20.0.sp,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'View more',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 12.0.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: darkBlue,
                            decorationThickness: 1.4,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right_alt,
                          color: darkBlue,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              GridView.count(
                mainAxisSpacing: 4.0.sp,
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: List.generate(
                  labTestController.labTests.length,
                  (index) {
                    final labTest = labTestController.labTests[index];
                    return SmallCard(labTest: labTest);
                  },
                ),
              ),
              SizedBox(
                height: 4.0.wp,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.0.sp,
                ),
                child: Text(
                  'Popular Packages',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 20.0.sp,
                  ),
                ),
              ),
              const FullCard(
                title: 'Full Body checkup',
                tests: 92,
                amount: 2000,
                detail1: 'Blood Glucose Fasting',
                detail2: 'Liver function Test',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
