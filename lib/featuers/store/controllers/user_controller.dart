import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/common_controller/choicechip_controller.dart';
import 'package:hapticadmin/common/common_controller/dropdown_controller.dart';
import 'package:hapticadmin/common/common_controller/imagepicker_controller.dart';
import 'package:hapticadmin/featuers/store/models/brandmodels.dart';
import 'package:hapticadmin/datas/repositry/user_repositry.dart';
import 'package:hapticadmin/featuers/store/models/prouductmodels.dart';
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
  final userrepositycontroller = Get.find<UserRepositry>();
  final dropdowncontroller = Get.find<Dropdowncontroller>();
  final imagepickercontroller = Get.find<Imagepickercontroller>();
  final addbrandtextcontroller = TextEditingController();
  final choicechipcontroller = Get.find<Choicechipcontroller>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Future<void> addproduct() async {
    try {
      print("products");
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
        brand: dropdowncontroller.selectedvalue.value!.brandname,
        color: colorcontroller.text,
        storage: storagecontroller.text.toUpperCase(),
      );
      await userrepositycontroller.addtheproducts(products, radnomnumber);
      print("add productssucesss");
    } catch (e) {
      throw "ERRZZORL$e";
    }
  }

  Future<void> editproducts(String id) async {
    try {
      print("Workingedsad");
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
        brand: dropdowncontroller.selectedvalue.value!.brandname,
        color: colorcontroller.text,
        storage: storagecontroller.text.toUpperCase(),
      );
      await userrepositycontroller.editheproduct(id, editheproducts);
    } catch (e) {
      print("ERROR$e");
    }
  }

  var serachresults = [].obs;
  var allresults = [].obs;
  void serachuser(String query) async {
    if (query.isEmpty) {
      serachresults.clear();
      print("empty working");
      return;
    }
    var result =
        await FirebaseFirestore.instance
            .collection("products")
            .where("mobiletitle", isGreaterThanOrEqualTo: query)
            .where("mobiletitle", isLessThanOrEqualTo: "${query}z")
            .get();

    serachresults.value = result.docs.map((doc) => doc.data()).toList();
    print("HEllo$query{query}");
  }

  totalelemrnys() async {
    var reuslts =
        await FirebaseFirestore.instance
            .collection("products")
            .orderBy("mobiletitle")
            .get();

    allresults.value = reuslts.docs;
  }

  Future<void> addbrand() async {
    try {
      final idd = DateTime.now().toString();
      final brandas = Brandmodels(
        id: idd,
        brandname: addbrandtextcontroller.text.toUpperCase(),
      );

      await userrepositycontroller.addbrandtochoicechips(idd, brandas);
      await choicechipcontroller.addbrandtoitems(
        addbrandtextcontroller.text.toUpperCase(),
        idd,
      );
      addbrandtextcontroller.clear();
      print("woring");
    } catch (e) {
      print("ERRROR:$e");
      Get.snackbar("SORRY", e.toString());
    }
  }

  Future<void> deletebrand(String id) async {
    await userrepositycontroller.deletebrand(id);
    await choicechipcontroller.deletebrandfromlist(id);
  }
}
