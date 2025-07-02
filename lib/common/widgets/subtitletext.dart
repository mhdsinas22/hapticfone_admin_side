import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Subtitletext extends StatelessWidget {
  const Subtitletext({super.key, required this.text, this.fontsize = 12});
  final String text;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontsize.sp));
  }
}
