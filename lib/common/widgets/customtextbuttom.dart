import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextbuttonCustomized extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final TextStyle? textStyle;
  final double width;
  final double heigth;
  final BoxDecoration? boxDecoration;
  const TextbuttonCustomized({
    super.key,
    required this.text,
    required this.onpressed,
    this.heigth = 50,
    this.width = 300,
    this.boxDecoration,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: heigth.h,
      decoration: boxDecoration,
      child: TextButton(
        onPressed: onpressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
