import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hapticadmin/featuers/store/controllers/user_controller.dart';

class BrandaddDialog {
  static branddialog(BuildContext context) {
    final usercontroller = Get.find<Usercontroller>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Back"),
            ),
            ElevatedButton(
              onPressed: () {
                print("ADDTEXT:${usercontroller.addbrandtextcontroller.text}");
                usercontroller.addbrand();

                Get.back();
              },
              child: Text("Add"),
            ),
          ],
          backgroundColor: Colors.white,
          title: Text("ADD THE BRAND"),
          content: Column(
            children: [
              TextFormField(
                controller: usercontroller.addbrandtextcontroller,
                decoration: InputDecoration(
                  labelText: "Add New Brand",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
