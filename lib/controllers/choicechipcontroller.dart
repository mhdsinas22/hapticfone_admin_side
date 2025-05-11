import 'package:get/get.dart';

class Choicechipcontroller extends GetxController {
  static Choicechipcontroller get instance => Get.find();
  var selectedindex = 0.obs;
  void seletedindex(int index) {
    selectedindex.value = index;
  }
}
