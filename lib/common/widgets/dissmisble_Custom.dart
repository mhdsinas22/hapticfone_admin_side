import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';

class DissmisbleCustom extends StatelessWidget {
  const DissmisbleCustom({super.key, required this.child, required this.id});
  final Widget child;
  final String id;
  @override
  Widget build(BuildContext context) {
    int? index;
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          print("Working");
        } else {}
      },
      background: Padding(
        padding: EdgeInsets.all(12.r),
        child: RectangleContainer(
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
          width: 347,
          heigth: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: Colors.white),
              SizedBox(width: 200.w),
            ],
          ),
        ),
      ),
      secondaryBackground: Padding(
        padding: EdgeInsets.all(12.r),
        child: RectangleContainer(
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          width: 347,
          heigth: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 200.w),
              Icon(Icons.delete, color: Colors.white),
            ],
          ),
        ),
      ),
      key: Key(index.toString()),
      child: child,
      // child:
      //  Selectedaddressui(
      //   ontap: () {
      //     addresscontroller.selectAddress(data[index]);
      //   },
      //   address: data[index],
      // ),
    );
  }
}
