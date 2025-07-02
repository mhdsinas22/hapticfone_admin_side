import 'package:cloud_firestore/cloud_firestore.dart';

class Addressmodels {
  late final String id;
  final int pincode;
  final String fullname;
  final int phonenumber;
  final String addresss;
  final String city;
  final String state;
  final String landmark;
  final DateTime? datetime;
  final String saveas;
  bool selectedaddress;
  Addressmodels({
    required this.id,
    required this.pincode,
    required this.fullname,
    required this.phonenumber,
    required this.addresss,
    required this.landmark,
    required this.city,
    required this.state,
    required this.datetime,
    required this.saveas,
    this.selectedaddress = true,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "pincode": pincode,
      "fullname": fullname,
      "phonenumber": phonenumber,
      "addresss": addresss,
      "city": city,
      "state": state,
      "landmark": landmark,
      "selectedaddress": selectedaddress,
      "datetime": datetime,
      "saveas": saveas,
    };
  }

  static Addressmodels empty() => Addressmodels(
    id: "id",
    pincode: 1,
    fullname: "",
    phonenumber: 91,
    addresss: "sdsd",
    landmark: "ss",
    city: "sds",
    state: "sd",
    datetime: DateTime.now(),
    saveas: "",
  );
  factory Addressmodels.fromsnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data != null) {
      return Addressmodels(
        id: data["id"] ?? "",
        saveas: data["saveas"] ?? "",
        pincode: int.parse(data["pincode"].toString()),
        fullname: data["fullname"] ?? "",
        phonenumber: int.parse(data["phonenumber"].toString()),
        addresss: data['addresss'] ?? "",
        landmark: data["landmark"] ?? "",
        city: data["city"] ?? '',
        state: data["state"] ?? "",
        datetime:
            data["datetime"] != null
                ? (data["datetime"] as Timestamp).toDate()
                : null,
        selectedaddress: data["selectedaddress"],
      );
    } else {
      return Addressmodels(
        saveas: "",
        id: "",
        pincode: 0,
        fullname: "",
        phonenumber: 0,
        addresss: "",
        landmark: "",
        city: "",
        state: "",
        datetime: DateTime.now(),
        selectedaddress: false,
      );
    }
  }
  factory Addressmodels.fromJson(Map<String, dynamic> json) {
    return Addressmodels(
      addresss: json["addresss"] ?? "",
      city: json["city"] ?? "",
      datetime:
          json["datetime"] != null
              ? (json["datetime"] as Timestamp).toDate()
              : null,
      fullname: json["fullname"] ?? "",
      id: json["id"] ?? "",
      landmark: json["landmark"] ?? "",
      phonenumber: int.parse(json["phonenumber"].toString()),
      pincode: int.parse(json["pincode"].toString()),
      saveas: json["saveas"] ?? "",
      state: json["state"] ?? "",
      selectedaddress: json["selectedaddress"] ?? "",
    );
  }
}
