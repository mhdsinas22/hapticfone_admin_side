import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';

class Snackbar {
  static waringsnakbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Appcolors.error,
      colorText: Appcolors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(10.r),
    );
  }
}
