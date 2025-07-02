import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/featuers/store/controllers/serachcontroller.dart';
import 'package:hapticadmin/featuers/store/models/brandmodels.dart';
import 'package:hapticadmin/featuers/store/models/prouductmodels.dart';

class UserRepositry extends GetxController {
  static UserRepositry get instance => Get.find();
  final serachcontroller = Get.find<Serachcontroller>();
  final _firestore = FirebaseFirestore.instance;
  var serachlist = List.empty(growable: true).obs;
  final _db = FirebaseFirestore.instance;
  // add the products
  Future<void> addtheproducts(
    Prouductmodels prodcutmodel,
    String documetid,
  ) async {
    try {
      final docref = _firestore.collection("products").doc(documetid);
      await docref.set(prodcutmodel.toJson());
      serachcontroller.addDataToList(prodcutmodel.toJson(), documetid);
    } catch (e) {
      Get.snackbar("on snap", e.toString());
    }
  }

  Future<void> deletetheproduct(String doucmentid) async {
    try {
      await _firestore.collection("products").doc(doucmentid).delete();
      serachcontroller.deletedatafromlist(doucmentid);
      Get.back();
      print("success$doucmentid");
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
      serachcontroller.updatetheuserlist(doucmentid, product.toJson());
      print("Edited");
    } catch (e) {
      print("SORRYY");
    }
  }

  Future<void> addbrandtochoicechips(
    String documentid,
    Brandmodels brands,
  ) async {
    await _db.collection("Addbrand").doc(documentid).set(brands.tojson());
  }

  Future<void> deletebrand(String id) async {
    await _db.collection("Addbrand").doc(id).delete();
  }
}
