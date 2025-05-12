import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/controllers/imagepickercontroller.dart';
import 'package:hapticadmin/controllers/usercontroller.dart';
import 'package:hapticadmin/widgets/addstocktextformfiled.dart';
import 'package:hapticadmin/widgets/container/rectangle_contianer.dart';
import 'package:hapticadmin/widgets/customtextbuttom.dart';

class AddstockPage extends StatelessWidget {
  const AddstockPage({
    super.key,
    required this.editpage,
    this.id = "",
    this.editcolor = "",
    this.editbrand = "",
    this.editcondion = "",
    this.editmobilename = "",
    this.editprice = 0,
    this.editram = "",
    this.editstock = 0,
    this.editstrogae = "",
    this.image,
  });
  final bool editpage;
  final String id;
  final String editcolor;
  final String editbrand;
  final String editmobilename;
  final String editstrogae;
  final String editram;
  final String editcondion;
  final int editstock;
  final double editprice;
  final List<dynamic>? image;
  @override
  Widget build(BuildContext context) {
    final imagepickercontroller = Get.put(Imagepickercontroller());
    final usercontroller = Get.put(Usercontroller());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          editpage == false ? "ADD STOCK" : "EDIT STOCK",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => imagepickercontroller.pickimage(),
              child: RectangleContainer(
                width: 304,
                heigth: 207,
                boxDecoration: BoxDecoration(border: Border.all()),
                child: Obx(() {
                  return imagepickercontroller.imagepatgs.isNotEmpty
                      ? CarouselSlider.builder(
                        itemCount: imagepickercontroller.imagepatgs.length,
                        options: CarouselOptions(viewportFraction: 1),

                        itemBuilder: (context, index, realIndex) {
                          return Image.file(
                            File(imagepickercontroller.imagepatgs[index]),
                          );
                        },
                      )
                      : Center(child: Icon(Icons.image));
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("1/10", style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(width: 40.w),
              ],
            ),
            Addstocktextformfiled(
              editcolor: editcolor,
              editbrand: editbrand,
              editcondion: editcondion,
              editmobilename: editmobilename,
              editprice: editprice,
              editram: editram,
              editstock: editstock,
              editstrogae: editstrogae,
            ),
            TextbuttonCustomized(
              textStyle: TextStyle(color: Colors.white, fontSize: 18.sp),
              text: editpage == false ? "ADD" : "Update",
              width: 150,
              heigth: 45,
              onpressed:
                  editpage == false
                      ? usercontroller.addproduct
                      : () {
                        usercontroller.editproducts(id);
                      },

              boxDecoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
