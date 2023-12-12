import 'package:alemeno_app/app/controller/main_controller.dart';
import 'package:alemeno_app/app/views/calendar/view.dart';
import 'package:alemeno_app/app/views/widgets/outlined_button.dart';
import 'package:alemeno_app/core/extensions/responsive.dart';
import 'package:alemeno_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleCard extends StatelessWidget {
  LabTestController controller = Get.find<LabTestController>();
  ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 12.0.hp,
        width: 90.0.wp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            border: Border.all(
              color: Colors.grey,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              size: 30,
            ),
            const SizedBox(
              width: 4.0,
            ),
            Obx(
              () => CustomOutlinedButton(
                color: Colors.grey,
                textColor:
                    controller.date.value == '' || controller.time.value == ''
                        ? Colors.grey.shade700
                        : darkBlue,
                isPadding: true,
                isCenter: false,
                text: controller.date.value == '' || controller.time.value == ''
                    ? 'Select Date'
                    : "${controller.date.value} (${controller.time.value})",
                height: 4.0.hp,
                width: 72.0.wp,
                radius: 6.0,
                onTap: () {
                  Get.to(() => CalendarPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
