import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Boldtext extends StatelessWidget {
  final String text;
  final double size;
  final Color? colors;
  final bool softwarp;
  final int? maxlines;
  const Boldtext({
    super.key,
    required this.text,
    this.size = 10,
    this.colors = Colors.black,
    this.softwarp = false,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size.sp,
        color: colors,
      ),
      softWrap: softwarp,
      maxLines: maxlines,
    );
  }
}
