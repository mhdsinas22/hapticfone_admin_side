import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/screens/login_screen.dart';
import 'package:hapticadmin/widgets/customtextbuttom.dart';

class Alertdialogg {
  final BuildContext context;
  Alertdialogg({required this.context});
  void showalertlog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: BeveledRectangleBorder(),
          title: Text("Confirm Logout"),
          backgroundColor: Colors.white,
          actions: [
            TextbuttonCustomized(
              textStyle: TextStyle(color: Colors.black),
              heigth: 50.h,
              text: "Cancel",
              onpressed: () => Get.back(),
              width: 100.w,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
            ),
            TextbuttonCustomized(
              boxDecoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              text: "Logout",
              textStyle: TextStyle(color: Colors.white),
              onpressed:
                  () => Get.offAll(
                    () => LoginScreen(),
                    transition: Transition.leftToRightWithFade,
                  ),
              width: 100.w,
            ),
          ],
        );
      },
    );
  }
}
