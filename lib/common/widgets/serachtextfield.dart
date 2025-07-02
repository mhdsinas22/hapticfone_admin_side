import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SerachTextfiled extends StatelessWidget {
  final String labeltext;
  final Icon? prefix;
  final ValueChanged? onchanged;
  const SerachTextfiled({
    super.key,
    required this.labeltext,
    this.prefix,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: TextField(
        onChanged: onchanged,
        decoration: InputDecoration(
          prefixIcon: prefix,
          label: Text(labeltext),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
