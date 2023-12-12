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
}
