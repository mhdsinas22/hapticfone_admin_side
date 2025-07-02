import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/datas/repositry/authentication_repository.dart';
import 'package:hapticadmin/featuers/store/models/ordermodel.dart';

import 'package:hapticadmin/featuers/store/models/revencesalemodels.dart';

class OrderRepositry extends GetxController {
  static OrderRepositry get instance => Get.find();
  final authenticationrepositry = Get.find<Authenticationrepository>();
  final _db = FirebaseFirestore.instance;
  Future<void> createorder(
    String docid,
    Ordermodel orderModels,
    var userid,
    String orderid,
  ) async {
    try {
      await _db
          .collection("Users")
          .doc(userid)
          .collection("orders")
          .doc(docid)
          .set(orderModels.tojson());
    } catch (e) {
      print("ERROROROR:$e");
    }
  }

  Future<void> updatetheorder(
    String id,
    String userId,
    Ordermodel orders,
  ) async {
    try {
      print("SUCCE SUPADTE");
      print("USERIDDDDDDD;-$userId");
      print("IDD$id");
      await _db
          .collection("Users")
          .doc(userId)
          .collection("orders")
          .doc(id)
          .update(orders.tojson());
    } catch (e) {
      print("ERROR:-$e");
      Get.snackbar("ERROR", e.toString());
    }
  }

  Future<void> createsalesdashboard(
    Revencesalemodels models,
    String date,
  ) async {
    await _db.collection("SalesRevenuve").doc(date).set(models.toJson());
  }
}
