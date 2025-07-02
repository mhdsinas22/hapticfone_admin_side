import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/featuers/store/models/brandmodels.dart';

class Choicechipcontroller extends GetxController {
  static Choicechipcontroller get instance => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    fethbrands();
    super.onInit();
  }

  RxList<Brandmodels> items = <Brandmodels>[].obs;
  RxString selectedindex = "ALL".obs;
  void seletedindex(String tag) {
    selectedindex.value = tag == selectedindex.value ? "ALL" : tag;
  }

  Future<void> fethbrands() async {
    var data = await FirebaseFirestore.instance.collection("Addbrand").get();
    items.value =
        data.docs.map((items) {
          return Brandmodels.frommap(items.data(), items.id);
        }).toList();
    items.refresh();
  }

  Future<void> addbrandtoitems(String brandname, String id) async {
    items.add(Brandmodels(brandname: brandname, id: id));
    items.refresh();
  }

  Future<void> deletebrandfromlist(String id) async {
    items.removeWhere((items) => items.id == id);
    await fethbrands();
    items.refresh();
  }
}
