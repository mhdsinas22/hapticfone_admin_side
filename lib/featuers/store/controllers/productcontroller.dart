import 'package:get/get.dart';
import 'package:hapticadmin/featuers/store/models/prouductmodels.dart';

class Productcontroller extends GetxController {
  static Productcontroller get instance => Get.find();
  final isloading = false.obs;
  RxList<Prouductmodels> prodoucts = <Prouductmodels>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchtheproducts() async {
    try {
      // Show Loader while loading Products
      isloading.value = true;
    } catch (e) {
      Get.snackbar("Oh shnap", e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
