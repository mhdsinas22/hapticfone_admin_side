import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hapticadmin/common/widgets/customtextbuttom.dart';

class Alertdialogg {
  final BuildContext context;
  final String titletext;
  final String leftsidetext;
  final String rightsidetext;
  final VoidCallback onpressd;
  Alertdialogg({
    required this.context,
    required this.titletext,
    required this.leftsidetext,
    required this.rightsidetext,
    required this.onpressd,
  });
  void showalertlog(bool isweb) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: BeveledRectangleBorder(),
          title: Text(titletext),
          backgroundColor: Colors.white,
          actions: [
            TextbuttonCustomized(
              textStyle: TextStyle(color: Colors.black),
              heigth: 50.h,
              text: leftsidetext,
              onpressed: () => Get.back(),
              width: isweb ? 10.w : 100.w,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
            ),
            TextbuttonCustomized(
              boxDecoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              text: rightsidetext,
              textStyle: TextStyle(color: Colors.white),
              onpressed: onpressd,
              width: isweb ? 10.w : 100.w,
            ),
          ],
        );
      },
    );
  }
}
