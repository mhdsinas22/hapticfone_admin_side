import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';

class Addresstext extends StatelessWidget {
  const Addresstext({
    super.key,
    this.width = 300,
    this.name = "",
    this.address = "",
    this.phonenumber = "",
    this.date = "",
    this.time = "",
    this.pincode = "",
    this.isweb = false,
  });
  final double width;
  final String name;
  final String address;
  final String phonenumber;
  final String date;
  final String time;
  final String pincode;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: Material(
        borderRadius: BorderRadius.circular(10.r),
        color: Appcolors.white,
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Appcolors.white,
          ),
          width: width.w,
          height: isweb ? 130.h : 170.h,

          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(children: [SizedBox(width: 5.w), Text("📍 Order Address")]),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Boldtext(
                        text: address.replaceAll(",", "\n"),
                        size: isweb ? 3 : 13,
                        maxlines: 3,
                        softwarp: false,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(
                        "📞 $phonenumber ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isweb ? 12 : 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(
                        "📮 $pincode",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isweb ? 12 : 12,
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(width: 10.w),
                  //     Boldtext(text: "🗓 Order Date & Time:  ", size: 10),
                  //   ],
                  // ),
                  // SizedBox(height: 5.h),
                  SizedBox(height: isweb ? 2.h : null),
                  Row(
                    children: [
                      SizedBox(width: isweb ? 3.w : null),
                      Boldtext(text: "    📅 $date ", size: isweb ? 3 : 10),
                      SizedBox(width: 10.w),
                      Boldtext(text: "⏰ $time", size: isweb ? 3 : 10),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
