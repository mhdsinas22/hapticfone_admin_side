import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/common_controller/dropdown_controller.dart';
import 'package:hapticadmin/datas/repositry/order_repositry.dart';
import 'package:hapticadmin/featuers/store/models/addressmodels.dart';
import 'package:hapticadmin/featuers/store/models/cartmodels.dart';
import 'package:hapticadmin/featuers/store/models/ordermodel.dart';

class Ordercontroller extends GetxController {
  static Ordercontroller get instance => Get.find();
  @override
  void onInit() {
    fetchAllOrdersFromAllUsers();
    super.onInit();
  }

  RxBool isloading = false.obs;
  var isharerror = false;
  final _db = FirebaseFirestore.instance;
  final orderrepositry = Get.find<OrderRepositry>();
  final dropdowncontroller = Get.find<Dropdowncontroller>();
  var orders = <Ordermodel>[].obs;
  final Map<String, int> statusPriority = {
    'Order Requested': 1,
    'Order Conifrmed': 2,
    'Order Started': 3,
    'Order Completed': 4,
    "Order Cancelled": 5,
  };

  Future<void> fetchAllOrdersFromAllUsers() async {
    print("fetching working");
    try {
      isloading.value = true;
      final QuerySnapshot usersSnapshot = await _db.collection("Users").get();
      print("Total users found: ${usersSnapshot.docs.length}");
      for (var userDoc in usersSnapshot.docs) {
        final String userId = userDoc.id;
        print("USERID:-$userId");
        final ordersSnapshot =
            await _db
                .collection("Users")
                .doc(userId)
                .collection("orders")
                .get();

        for (var orderDoc in ordersSnapshot.docs) {
          // 🔥 Correct place to convert order document to model
          orders.add(Ordermodel.fromsnapshot(orderDoc));

          print('Order from user $userId: ${orderDoc.data()}');
        }
        orders.sort((a, b) {
          int aPriority = statusPriority[a.currentstatus] ?? 99;
          int bPriority = statusPriority[b.currentstatus] ?? 99;

          if (aPriority != bPriority) {
            return aPriority.compareTo(bPriority);
          }

          int aId = int.parse(a.orderid.replaceAll("ORD", ""));
          int bId = int.parse(b.orderid.replaceAll("ORD", ""));

          return bId.compareTo(aId);
        });
      }
      orders.sort((a, b) {
        int aPriority = statusPriority[a.currentstatus] ?? 99;
        int bPriority = statusPriority[b.currentstatus] ?? 99;

        if (aPriority != bPriority) {
          return aPriority.compareTo(bPriority);
        }

        int aId = int.parse(a.orderid.replaceAll("ORD", ""));
        int bId = int.parse(b.orderid.replaceAll("ORD", ""));

        return bId.compareTo(aId);
      });

      print("Total orders: ${orders.length}");
    } catch (e) {
      print("ERROR: $e");
    } finally {
      isloading.value = false;
    }
  }

  Future<void> updatetheorder(
    String id,
    String userid,
    String confirmtime,
    String orderConfirmeddata,
    String paymetmode,
    String totalamount,
    String orderid,
    List<Cartmodels> cartmodels,
    Addressmodels? addresmodels,
  ) async {
    try {
      print("ID IS $id");
      print(
        "UPDATEVALYE IS :- ${dropdowncontroller.markorderselectedvalue.value}",
      );
      print("USERid:-$userid");
      print("ORDER ID:-$orderid");
      final orderupdate = Ordermodel(
        id: id,
        addressmodels: addresmodels,
        items: cartmodels,
        currentstatus: dropdowncontroller.markorderselectedvalue.value,
        orderid: orderid,
        userid: userid,
        paymetmode: paymetmode,
        totalAmount: double.parse(totalamount).toDouble(),
        orderconfirmeddate: orderConfirmeddata,
        confirmedTime: confirmtime,
        orderConfirmed: dropdowncontroller.orderConfirmed.value,
        orderStrated: dropdowncontroller.orderStrated.value,
        orderCompleted: dropdowncontroller.orderCompleted.value,
      );
      await orderrepositry.updatetheorder(id, userid, orderupdate);
      ;
    } catch (e) {
      print("ERRrrrrrrrrOR$e");
    }
  }
}
