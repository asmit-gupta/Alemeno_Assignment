import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import '../model/test_item_model.dart';

class LabTestController extends GetxController {
  final labTests = <LabTestModel>[
    LabTestModel(
      title: 'Thyroid Profile',
      tests: 3,
      hours: 24,
      amount: 1000,
      costPrice: 1400,
    ),
    LabTestModel(
      title: 'Iron Study Test',
      tests: 4,
      hours: 24,
      amount: 600,
      costPrice: 1000,
    ),
    LabTestModel(
      amount: 1200,
      costPrice: 1600,
      hours: 24,
      tests: 14,
      title: 'Diabetes Profile',
    ),
    LabTestModel(
      amount: 1000,
      costPrice: 1400,
      hours: 24,
      tests: 20,
      title: 'CBC',
    ),
  ].obs;

  RxList cartList = [].obs;
  RxString date = ''.obs;
  RxString time = ''.obs;
  var currentday = DateTime.now().obs;
  var focusday = DateTime.now().obs;
  RxInt calendarIndex = 20
      .obs; //chose a random number greater than 12, so that it doesn't effect grid timeline.

  RxBool hardCopy = false.obs;

  void addItemInCart(LabTestModel labTestModel) {
    if (!cartList.contains(labTestModel)) {
      cartList.add(labTestModel);
    } else {
      print('Item already in the cart');
    }
    cartList.refresh();
  }

  void removeItemFromCart(LabTestModel labTestModel) {
    cartList.remove(labTestModel);
    cartList.refresh();
  }

  String calculateTotalMRP() {
    int totalMRP = cartList.cast<LabTestModel>().fold<int>(
          0,
          (int previousValue, LabTestModel labTest) =>
              previousValue + labTest.costPrice,
        );
    return totalMRP.toString();
  }

  String calculateTotalAmount() {
    int totalMRP = cartList.cast<LabTestModel>().fold<int>(
          0,
          (int previousValue, LabTestModel labTest) =>
              previousValue + labTest.amount,
        );
    return totalMRP.toString();
  }

  String calculateDiscount() {
    int totalMRP = int.parse(calculateTotalMRP());
    int totalAmount = int.parse(calculateTotalAmount());
    int discount = totalMRP - totalAmount;
    return discount.toString();
  }

  void sendNotification(String title, String body) {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(1000),
        channelKey: 'alemeno',
        title: title,
        body: body,
        displayOnForeground: true,
        fullScreenIntent: true,
      ),
    );
  }

  void reset() {
    cartList.clear();
    date.value = '';
    time.value = '';
    hardCopy.value = false;
    calendarIndex.value = 20;
    currentday.value = DateTime.now();
    focusday.value = DateTime.now();
  }
}
