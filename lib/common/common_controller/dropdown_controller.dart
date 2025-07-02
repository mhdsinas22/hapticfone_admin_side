import 'package:get/get.dart';

import 'package:hapticadmin/featuers/store/models/brandmodels.dart';

class Dropdowncontroller extends GetxController {
  static Dropdowncontroller get instance => Get.find();
  // final ordercontroller = Get.find<Ordercontroller>();
  var branditems =
      [
        "Apple",
        "Samsung",
        "Oneplus",
        "Mi",
        "Realme",
        "Poco",
        "Vivo",
        "Oppo",
        "Google",
        "Motorola",
        "Other",
      ].obs;
  var condtionitems = [
    "Brand New",
    "Box Open",
    "Like New",
    "Pre-owned",
    "Renewed",
    "Grade A Used",
    "Grade B Used",
  ];
  var markorderitems = ["Order Conifrmed", "Order Started", "Order Completed"];
  var markorderselectedvalue = "".obs;
  var orderConfirmed = "Order Conifrmed".obs;
  var orderStrated = "Order Started".obs;
  var orderCompleted = 'Order Completed'.obs;
  var condtionselectedvalue = "Brand New".obs;
  Rxn<Brandmodels> selectedvalue = Rxn<Brandmodels>();
  void changethevaluebrand(Brandmodels value) {
    selectedvalue.value = value;
  }

  void changethevaluecondtion(String value) {
    condtionselectedvalue.value = value;
  }

  void changetheordervalye(String value, String id) {
    if (orderConfirmed.value != "Order Conifrmed") {
      orderConfirmed.value = value;
      markorderselectedvalue.value = value;
    } else if (orderStrated.value != "Order Started") {
      orderStrated.value = value;
      markorderselectedvalue.value = value;
    } else {
      print("LAST WOEKING");
      orderCompleted.value = value;
      markorderselectedvalue.value = value;
    }
  }
}
