import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectangleContainer extends StatelessWidget {
  final Color color;
  final BoxDecoration? boxDecoration;
  final double radius;
  final double padding;
  final Widget? child;
  final double heigth;
  final double width;
  const RectangleContainer({
    super.key,
    this.color = Colors.white,
    this.boxDecoration,
    this.radius = 0,
    this.padding = 0,
    this.heigth = 216,
    this.width = 371,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      width: width.w,
      height: heigth.h,
      child: child,
    );
  }
}
