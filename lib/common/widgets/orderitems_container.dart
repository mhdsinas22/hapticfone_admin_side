import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';

class OrderitemsContainer extends StatelessWidget {
  const OrderitemsContainer({
    super.key,
    required this.brand,
    required this.color,
    required this.itemconunt,
    required this.phoenname,
    required this.price,
    required this.storage,
    required this.thumbnail,
    this.isweb = false,
  });
  final String thumbnail;
  final String phoenname;
  final String storage;
  final String brand;
  final String color;
  final double price;
  final String itemconunt;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return RectangleContainer(
      boxDecoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      width: isweb ? 400.w : 400.w,
      heigth: isweb ? 180 : 110,
      child: Column(
        children: [
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment:
                isweb ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              RectangleContainer(
                width: 100,
                heigth: isweb ? 150 : 100,
                boxDecoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(thumbnail, fit: BoxFit.contain),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Boldtext(text: phoenname, size: isweb ? 5 : 10),
                  Boldtext(text: "Storage:-$storage", size: isweb ? 5 : 10),
                  Boldtext(text: "Brand:-$brand", size: isweb ? 5 : 10),
                  Boldtext(text: "Color:-$color", size: isweb ? 5 : 10),
                  Boldtext(
                    text: "Price:-$price".toString(),
                    size: isweb ? 5 : 10,
                  ),
                  Boldtext(
                    text: "Item Count:-$itemconunt",
                    size: isweb ? 5 : 10,
                  ),
                ],
              ),
              SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
