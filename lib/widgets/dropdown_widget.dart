import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    super.key,
    required this.items,
    required this.onchanged,
    this.hinttext = "",
    this.values,
  });
  final List<DropdownMenuItem> items;
  final ValueChanged onchanged;
  final String hinttext;
  final dynamic values;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: values,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      items: items,
      onChanged: onchanged,
      hint: Text(hinttext),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.yellow),
        ),
      ),
    );
  }
}
