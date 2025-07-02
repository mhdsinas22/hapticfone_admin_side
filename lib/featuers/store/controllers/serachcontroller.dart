import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/common_controller/choicechip_controller.dart';

class Serachcontroller extends GetxController {
  static Serachcontroller get instance => Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    fetcdata();
    super.onInit();
  }

  var serachtext = "".obs;
  var userlist = [].obs;
  var selectedbrand = "ALL".obs;
  final chociechipcontroller = Get.put(Choicechipcontroller());
  final _db = FirebaseFirestore.instance;
  var isloading = true.obs;
  var haserror = false.obs;
  Future<void> fetcdata() async {
    try {
      isloading.value = true;
      haserror.value = false;
      final fetchData = await _db.collection("products").get();
      userlist.value = fetchData.docs;
    } catch (e) {
      haserror.value = true;
      print("Error fetching data: $e"); // debug purpose
    } finally {
      isloading.value = false;
    }
  }

  Future<void> addDataToList(Map<String, dynamic> product, String docid) async {
    await _db.collection("products").doc(docid).set(product);
    fetcdata();
  }

  Future<void> deletedatafromlist(String doc) async {
    await _db.collection("products").doc(doc).delete();
    fetcdata();
  }

  Future<void> updatetheuserlist(
    String docid,
    Map<String, dynamic> prodxtmodel,
  ) async {
    await _db.collection("products").doc(docid).update(prodxtmodel);
    fetcdata();
  }

  List get filteditems {
    List filtred = userlist;

    if (chociechipcontroller.selectedindex.value != "ALL") {
      filtred =
          filtred
              .where(
                (items) =>
                    items["brand"].toString().toUpperCase() ==
                    chociechipcontroller.selectedindex.value.toUpperCase(),
              )
              .toList();
    }

    //  Search filtering
    if (serachtext.value.isNotEmpty) {
      filtred =
          filtred
              .where(
                (data) => data["mobiletitle"].toString().toLowerCase().contains(
                  serachtext.value.toLowerCase(),
                ),
              )
              .toList();
    }

    return filtred;
  }
}
