import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/views/success/widget/success_card.dart';
import 'package:alemeno_app/app/views/widgets/button.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  final controller = Get.find<LabTestController>();
  SuccessPage({super.key});

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
          'Success',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0.sp,
          ),
        ),
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
            child: Button(
              color: darkBlue,
              text: 'Go to home',
              height: 7.0.hp,
              width: 90.0.wp,
              onTap: () {
                controller.reset();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('home', (route) => false);
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: SuccessCard(
          date: controller.date.value,
          time: controller.time.value,
        ),
      ),
    );
  }
}
