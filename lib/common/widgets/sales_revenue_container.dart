import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';

class Salesrevuncecontainer extends StatelessWidget {
  const Salesrevuncecontainer({
    super.key,
    required this.text,
    required this.needicon,
    required this.price,
    this.needrupeesign = false,
    this.isweb = false,
  });
  final String text;
  final bool needicon;
  final bool needrupeesign;
  final String price;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return RectangleContainer(
      width: isweb ? 30.99.w : 147.99.w,
      heigth: 120.77.h,
      boxDecoration: BoxDecoration(
        color: Appcolors.black,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Column(
          children: [
            needicon
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_cart,
                    size: isweb ? 10.sp : 40.sp,
                    color: Appcolors.white,
                  ),
                )
                : Boldtext(
                  text: "₹",
                  colors: Appcolors.white,
                  size: isweb ? 3.sp : 32.sp,
                ),
            Boldtext(
              text: text,
              colors: Appcolors.white,
              size: isweb ? 1.sp : 16.sp,
            ),
            needrupeesign
                ? Text(
                  "₹$price",
                  style: TextStyle(
                    fontSize: isweb ? 4.sp : 16.sp,
                    color: Appcolors.white,
                  ),
                )
                : Boldtext(
                  text: price,
                  colors: Appcolors.white,
                  size: isweb ? 1.sp : 16.sp,
                ),
          ],
        ),
      ),
    );
  }
}
