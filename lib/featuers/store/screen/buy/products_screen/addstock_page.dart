import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/common_controller/imagepicker_controller.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/common/widgets/add_stock_textformfiled.dart';
import 'package:hapticadmin/common/widgets/customtextbuttom.dart';
import 'package:hapticadmin/featuers/store/controllers/user_controller.dart';

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
    final imagepickercontroller = Get.find<Imagepickercontroller>();
    final usercontroller = Get.find<Usercontroller>();

    if (editpage && imagepickercontroller.imagepatgs.isEmpty && image != null) {
      imagepickercontroller.imagepatgs.value = List<String>.from(image!);
    }
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
                          final path = imagepickercontroller.imagepatgs[index];
                          return path.startsWith("http")
                              ? Image.network(path)
                              : Image.file(
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
              onpressed: () async {
                if (usercontroller.formkey.currentState!.validate()) {
                  print("Working");
                  editpage == false
                      ? await usercontroller.addproduct()
                      : await usercontroller.editproducts(id);
                }
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
