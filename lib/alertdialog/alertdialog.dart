import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alertdialogcustomized extends GetxController {
  static Alertdialogcustomized get instance => Get.find();
  edittheproduct(String id, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Products"),
          content: Column(children: [TextFormField()]),
        );
      },
    );
  }
}
