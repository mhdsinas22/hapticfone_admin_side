import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hapticadmin/featuers/store/models/addressmodels.dart';
import 'package:hapticadmin/featuers/store/models/cartmodels.dart';

class Ordermodel {
  final String id;
  final List<Cartmodels> items;
  final Addressmodels? addressmodels;
  final String orderid;
  final String currentstatus;
  final String userid;
  final String paymetmode;
  final double totalAmount;
  final String orderconfirmeddate;
  final String confirmedTime;
  final String orderConfirmed;
  final String orderStrated;
  final String orderCompleted;
  Ordermodel({
    required this.id,
    required this.addressmodels,
    required this.items,
    required this.currentstatus,
    required this.orderid,
    required this.userid,
    required this.paymetmode,
    required this.totalAmount,
    required this.orderconfirmeddate,
    required this.confirmedTime,
    required this.orderConfirmed,
    required this.orderStrated,
    required this.orderCompleted,
  });
  tojson() {
    return {
      "id": id,
      "cartmodels": items.map((item) => item.toJson()).toList(),
      "addressmodels": addressmodels?.toJson(),
      "orderid": orderid,
      "currentstatus": currentstatus,
      "userid": userid,
      "paymentmode": paymetmode,
      "totalamount": totalAmount,
      "confirmedorderdate": orderconfirmeddate,
      "confirmedTime": confirmedTime,
      "orderConfirmed": orderConfirmed,
      "orderStrated": orderStrated,
      "orderCompleted": orderCompleted,
    };
  }

  factory Ordermodel.fromJson(Map<String, dynamic> json) {
    return Ordermodel(
      id: json['id'] ?? '',
      orderid: json['orderid'] ?? '',
      userid: json['userid'] ?? 1,
      paymetmode: json["paymentmode"] ?? "",
      totalAmount: json["totalamount"] ?? "",
      orderconfirmeddate: json["confirmedorderdate"] ?? "",
      currentstatus: json["currentstatus"] ?? "",
      confirmedTime: json["confirmedTime"] ?? "",
      orderConfirmed: json["orderConfirmed"] ?? "",
      orderStrated: json["orderStrated"] ?? "",
      orderCompleted: json["  orderCompleted"] ?? "",
      addressmodels:
          json["addressmodels"] != null
              ? Addressmodels.fromsnapshot(json["addressmodels"])
              : null,
      items:
          (json["cartmodels"] as List<dynamic>).map((elemtnet) {
            return Cartmodels.fromJson(elemtnet);
          }).toList(),
    );
  }
  factory Ordermodel.fromsnapshot(
    DocumentSnapshot<Map<String, dynamic>> doucmert,
  ) {
    final data = doucmert.data();
    return Ordermodel(
      id: data!["id"] ?? "",
      currentstatus: data["currentstatus"] ?? "",
      orderid: data["orderid"] ?? "",
      paymetmode: data["paymentmode"] ?? "",
      totalAmount: (data["totalamount"] ?? 0).toDouble(),

      userid: data["userid"] ?? "",
      orderconfirmeddate: data["confirmedorderdate"] ?? "",
      confirmedTime: data["confirmedTime"] ?? "",
      orderConfirmed: data["orderConfirmed"] ?? "",
      orderStrated: data["orderStrated"] ?? "",
      orderCompleted: data["orderCompleted"] ?? '',
      addressmodels:
          data["addressmodels"] != null
              ? Addressmodels.fromJson(
                data["addressmodels"],
              ) // fromsnapshot alla!
              : null,
      items:
          (data["cartmodels"] as List<dynamic>?)?.map((elemtnet) {
            return Cartmodels.fromJson(elemtnet);
          }).toList() ??
          [],
    );
  }
}
