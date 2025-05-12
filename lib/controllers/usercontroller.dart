import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/controllers/dropdowncontroller.dart';
import 'package:hapticadmin/controllers/imagepickercontroller.dart';
import 'package:hapticadmin/models/prouductmodels.dart';
import 'package:hapticadmin/repositry/user_repositry.dart';
import 'package:random_string/random_string.dart';

class Usercontroller extends GetxController {
  static Usercontroller get instance => Get.find();
  String radnomnumber = randomAlphaNumeric(10);
  final stockquantity = TextEditingController();
  final mobilename = TextEditingController();
  final ramcontroller = TextEditingController();
  final colorcontroller = TextEditingController();
  final storagecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final userrepositycontroller = Get.put(UserRepositry());
  final dropdowncontroller = Get.put(Dropdowncontroller());
  final imagepickercontroller = Get.put(Imagepickercontroller());
  Future<void> addproduct() async {
    await imagepickercontroller.uploadimagetocloudinary();
    final products = Prouductmodels(
      id: radnomnumber,
      mobilemodelname: mobilename.text,
      stock: int.parse(stockquantity.text),
      price: double.parse(pricecontroller.text),
      thumbnail: imagepickercontroller.uploadimagessssssulrl.first,
      images: imagepickercontroller.uploadimagessssssulrl,
      condtion: dropdowncontroller.condtionselectedvalue.value,
      ram: ramcontroller.text,
      brand: dropdowncontroller.selectedvalue.value,
      color: colorcontroller.text,
      storage: storagecontroller.text,
    );
    userrepositycontroller.addtheproducts(products, radnomnumber);
    print("add productssucesss");
  }

  // Future<void> clearimages() async {
  //   print("worfingg");
  //   imagepickercontroller.imagepatgs.clear();
  // }

  Future<void> editproducts(String id) async {
    await imagepickercontroller.uploadimagetocloudinary();
    final editheproducts = Prouductmodels(
      id: id,
      mobilemodelname: mobilename.text,
      stock: int.parse(stockquantity.text),
      price: double.parse(pricecontroller.text),
      thumbnail: imagepickercontroller.uploadimagessssssulrl.first,
      images: imagepickercontroller.uploadimagessssssulrl,
      condtion: dropdowncontroller.condtionselectedvalue.value,
      ram: ramcontroller.text,
      brand: dropdowncontroller.selectedvalue.value,
      color: colorcontroller.text,
      storage: storagecontroller.text,
    );
    userrepositycontroller.editheproduct(id, editheproducts);
  }
}
