import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/models/prouductmodels.dart';

class UserRepositry extends GetxController {
  static UserRepositry get instance => Get.find();

  final _firestore = FirebaseFirestore.instance;

  // add the products
  Future<void> addtheproducts(
    Prouductmodels prodcutmodel,
    String documetid,
  ) async {
    try {
      final docref = _firestore.collection("products").doc(documetid);
      await docref.set(prodcutmodel.toJson());
    } catch (e) {
      Get.snackbar("on snap", e.toString());
    }
  }

  Future<void> deletetheproduct(String doucmentid) async {
    try {
      await _firestore.collection("products").doc(doucmentid).delete();
      print("success");
    } catch (e) {
      print("soryy");
    }
  }

  Future<void> editheproduct(String doucmentid, Prouductmodels product) async {
    try {
      await _firestore
          .collection("products")
          .doc(doucmentid)
          .update(product.toJson());
      print("Edited");
    } catch (e) {
      print("SORRYY");
    }
  }
}
