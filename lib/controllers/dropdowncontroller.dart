import 'package:get/get.dart';

class Dropdowncontroller extends GetxController {
  static Dropdowncontroller get instance => Get.find();
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
  var condtionselectedvalue = "Brand New".obs;
  var selectedvalue = "Apple".obs;
  void changethevaluebrand(String value) {
    selectedvalue.value = value;
  }

  void changethevaluecondtion(String value) {
    condtionselectedvalue.value = value;
  }
}
