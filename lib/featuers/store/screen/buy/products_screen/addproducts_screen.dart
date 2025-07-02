import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/common_controller/choicechip_controller.dart';
import 'package:hapticadmin/common/widgets/customtextbuttom.dart';
import 'package:hapticadmin/common/widgets/serachtextfield.dart';
import 'package:hapticadmin/featuers/store/controllers/serachcontroller.dart';
import 'package:hapticadmin/common/widgets/drawer_custom.dart';
import 'package:hapticadmin/common/widgets/fetechdata_display.dart';
import 'package:hapticadmin/responsive/responsive_addstock_screen.dart';

class AddproductsScreen extends StatelessWidget {
  const AddproductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final choicecontrooler = Get.put(Choicechipcontroller());
    final serachcontroller = Get.put(Serachcontroller());
    // final notficationcontroller = Get.find<Notifcationcontroller>();
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
          onpressed:
              () => Get.to(() => ResponsiveAddstockScreen(editpage: false)),
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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SerachTextfiled(
              onchanged: (value) => serachcontroller.serachtext.value = value,
              labeltext: "Search the Mobiles",
              prefix: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.r),
            child: Row(
              children: [
                SizedBox(width: 4.w),
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
                SizedBox(width: 18.w),
                Obx(
                  () => Wrap(
                    spacing: 8,
                    children: List.generate(choicecontrooler.items.length, (
                      index,
                    ) {
                      var item = choicecontrooler.items[index];
                      return ChoiceChip(
                        backgroundColor: Colors.white,
                        side: BorderSide(),
                        labelStyle: TextStyle(
                          color:
                              choicecontrooler.selectedindex.value ==
                                      item.brandname
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        selectedColor: Colors.black,
                        showCheckmark: false,
                        label: Text(item.brandname),
                        selected:
                            choicecontrooler.selectedindex.value ==
                            item.brandname,
                        onSelected: (value) {
                          if (value) {
                            choicecontrooler.selectedindex.value =
                                item.brandname;
                          }
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
