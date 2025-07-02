import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Cartmodels {
  final String id;
  String thumbnail;
  String mobilemodelname;
  String condtion;
  double price;
  String ram;
  String storage;
  String brand;
  String color;
  int stock;
  RxInt count;
  RxDouble changingprice;
  Cartmodels({
    required this.id,
    required this.mobilemodelname,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.condtion,
    required this.ram,
    required this.brand,
    required this.color,
    required this.storage,
    required int initalcount,
    required double initalprice,
  }) : count = initalcount.obs,
       changingprice = initalprice.obs;
  //Create empty func for clean code
  static empty() => Cartmodels(
    id: "",
    mobilemodelname: "",
    stock: 0,
    price: 0,
    thumbnail: "",
    condtion: "",
    ram: "ram",
    brand: "brand",
    color: "color",
    storage: "storage",
    initalcount: 1,
    initalprice: 10,
  );
  // Convert the Model to Json Stuctue to store the firebase
  toJson() {
    return {
      "initaloruce": changingprice.value,
      "Count": count.value,
      "id": id,
      "mobiletitle": mobilemodelname,
      "stock": stock,
      "price": price,
      "thumbnail": thumbnail,
      // "images": images,
      "condtion": condtion,
      "ram": ram,
      "brand": brand,
      "color": color,
      "stroage": storage,
      "changeprice": changingprice.value,
    };
  }

  factory Cartmodels.fromJson(Map<String, dynamic> json) {
    return Cartmodels(
      mobilemodelname: json['mobiletitle'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      initalcount: json['Count'] ?? 1,
      brand: json["brand"],
      color: json["color"],
      condtion: json["condtion"],
      ram: json["ram"],
      id: json["id"],
      storage: json["stroage"],
      stock: json["stock"],
      initalprice: double.parse(json["initaloruce"].toString()),
    );
  }

  //Map json oriented doucment snapshot from Firebase to Model
  factory Cartmodels.fromsnapshot(
    DocumentSnapshot<Map<String, dynamic>> doucmert,
  ) {
    final data = doucmert.data();
    return Cartmodels(
      initalprice: doucmert["initaloruce"],
      id: doucmert.id,
      mobilemodelname: data?["mobiletitle"],
      stock: data?["stock"] ?? 0,
      price: data!["price"] ?? 0,
      thumbnail: data["thumbnail"],
      // images: data["images"] != null ? List<String>.from(data["images"]) : [],
      condtion: data["condtion"],
      ram: data["ram"],
      brand: data["brand"],
      color: data["color"],
      storage: data["stroage"],
      initalcount: data["Count"],
    );
  }
}
