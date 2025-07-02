import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/common/widgets/customtextbuttom.dart';

class Buttons {
  static RectangleContainer inactivebutton(String text) {
    return RectangleContainer(
      heigth: 52,
      width: 200,
      boxDecoration: BoxDecoration(color: Appcolors.appgrey),
      child: Center(
        child: Boldtext(text: text, size: 20, colors: Appcolors.chipfontcolor),
      ),
    );
  }

  static TextbuttonCustomized activeButton(
    String text,
    VoidCallback onpressed,
  ) {
    return TextbuttonCustomized(
      heigth: 52,
      width: 200,
      text: text,
      onpressed: onpressed,
      textStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
      boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
    );
  }
}
