import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/models/prouductmodels.dart';

class Serachcontroller extends GetxController {
  var serachproducts = <Prouductmodels>[].obs;
  var filterditems = <Prouductmodels>[].obs;
  var serachcontroller = TextEditingController();
}
