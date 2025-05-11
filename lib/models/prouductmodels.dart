import 'package:cloud_firestore/cloud_firestore.dart';

class Prouductmodels {
  final String id;
  String thumbnail;
  String mobilemodelname;
  String condtion;
  double price;
  List<String> images;
  String ram;
  String storage;
  String brand;
  String color;
  int stock;
  Prouductmodels({
    required this.id,
    required this.mobilemodelname,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.images,
    required this.condtion,
    required this.ram,
    required this.brand,
    required this.color,
    required this.storage,
  });

  //Create empty func for clean code
  static empty() => Prouductmodels(
    id: "",
    mobilemodelname: "",
    stock: 0,
    price: 0,
    thumbnail: "",
    images: [],
    condtion: "",
    ram: "ram",
    brand: "brand",
    color: "color",
    storage: "storage",
  );
  // Convert the Model to Json Stuctue to store the firebase
  toJson() {
    return {
      "id": id,
      "mobiletitle": mobilemodelname,
      "stock": stock,
      "price": price,
      "thumbnail": thumbnail,
      "images": images,
      "condtion": condtion,
      "ram": ram,
      "brand": brand,
      "color": color,
      "stroage": storage,
    };
  }

  //Map json oriented doucment snapshot from Firebase to Model
  factory Prouductmodels.fromsnapshot(
    DocumentSnapshot<Map<String, dynamic>> doucmert,
  ) {
    final data = doucmert.data();
    return Prouductmodels(
      id: doucmert.id,
      mobilemodelname: data?["mobiletitle"],
      stock: data?["stock"] ?? 0,
      price: data!["price"] ?? 0,
      thumbnail: data["thumbnail"],
      images: data["images"] != null ? List<String>.from(data["images"]) : [],
      condtion: data["condtion"],
      ram: data["ram"],
      brand: data["brand"],
      color: data["color"],
      storage: data["stroage"],
    );
  }
}
