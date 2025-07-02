import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbarcustomized extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centertile;
  final double fontsize;
  final FontWeight fontweight;
  final List<Widget>? action;
  const Appbarcustomized({
    super.key,
    required this.title,
    this.centertile = true,
    this.fontsize = 32,
    this.fontweight = FontWeight.bold,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: action,
      backgroundColor: Colors.white,
      centerTitle: centertile,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontsize.sp,
          fontWeight: fontweight,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Container(color: Colors.black, height: 1.w),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
