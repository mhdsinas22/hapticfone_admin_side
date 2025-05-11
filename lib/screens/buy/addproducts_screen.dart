import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/alertdialog/alertdialog.dart';
import 'package:hapticadmin/controllers/choicechipcontroller.dart';
import 'package:hapticadmin/screens/buy/addstock_page.dart';
import 'package:hapticadmin/widgets/customtextbuttom.dart';
import 'package:hapticadmin/widgets/drawer_custom.dart';
import 'package:hapticadmin/widgets/fetechdata_display.dart';
import 'package:hapticadmin/widgets/serachtextfield.dart';

// ignore: must_be_immutable
class AddproductsScreen extends StatelessWidget {
  AddproductsScreen({super.key});
  final List<String> options = [
    "ALL",
    "APPLE",
    "SAMSUNG",
    "GOOGLE",
    "VIVO",
    "OPPO",
    "REALME",
    "ONEPLUS",
  ];
  @override
  Widget build(BuildContext context) {
    final choicecontrooler = Get.put(Choicechipcontroller(), permanent: true);
    Get.put(Alertdialogcustomized());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.r),
        child: TextbuttonCustomized(
          width: 333.w,
          heigth: 41.h,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
          ),
          boxDecoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          text: "ADD ITEMS",
          onpressed: () => Get.to(() => AddstockPage(editpage: false)),
        ),
      ),
      drawer: DrawerCustom(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PRODUCTS",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SerachTextfiled(
            labeltext: "Search the Mobiles",
            prefix: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(13.r),
            child: Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19.sp,
                  ),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Obx(
                  () => Wrap(
                    spacing: 5,
                    children: List.generate(options.length, (index) {
                      return ChoiceChip(
                        backgroundColor: Colors.white,
                        side: BorderSide(),
                        labelStyle: TextStyle(
                          color:
                              choicecontrooler.selectedindex.value == index
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        selectedColor: Colors.black,
                        showCheckmark: false,
                        label: Text(options[index]),
                        selected: choicecontrooler.selectedindex.value == index,
                        onSelected: (bool selected) {
                          choicecontrooler.selectedindex(index);
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          FetechdataDisplay(),
        ],
      ),
    );
  }
}
