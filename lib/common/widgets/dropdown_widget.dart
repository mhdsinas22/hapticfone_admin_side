import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownWidget<T> extends StatelessWidget {
  const DropdownWidget({
    super.key,
    required this.items,
    required this.onchanged,
    this.hinttext = "",
    this.value,
    this.validator,
  });
  final List<DropdownMenuItem<T>> items;
  final ValueChanged onchanged;
  final String hinttext;
  final dynamic value;
  final FormFieldValidator? validator;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator: validator,
      value: value,
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
