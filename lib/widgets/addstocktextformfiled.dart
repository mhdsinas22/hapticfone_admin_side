import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/controllers/dropdowncontroller.dart';
import 'package:hapticadmin/controllers/usercontroller.dart';
import 'package:hapticadmin/widgets/dropdown_widget.dart';

class Addstocktextformfiled extends StatelessWidget {
  const Addstocktextformfiled({
    super.key,
    required this.editcolor,
    this.editbrand = "",
    this.editcondion = "",
    this.editmobilename = "",
    this.editprice = 0,
    this.editram = "",
    this.editstock = 0,
    this.editstrogae = "",
  });
  final String editcolor;
  final String editbrand;
  final String editmobilename;
  final String editstrogae;
  final String editram;
  final String editcondion;
  final int editstock;
  final double editprice;
  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(Usercontroller());
    final dropdowncontroller = Get.put(Dropdowncontroller());
    usercontroller.colorcontroller.text = editcolor;
    usercontroller.pricecontroller.text = editprice.toString();
    usercontroller.mobilename.text = editmobilename;
    usercontroller.storagecontroller.text = editstrogae;
    usercontroller.ramcontroller.text = editram;
    usercontroller.stockquantity.text = editstock.toString();
    dropdowncontroller.selectedvalue.value = editbrand;
    dropdowncontroller.condtionselectedvalue.value = editcondion;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 340.w,
            child: Obx(
              () => DropdownWidget(
                // values: dropdowncontroller.selectedvalue.value,
                hinttext: "Select the Brand",
                items:
                    dropdowncontroller.branditems
                        .map(
                          (String items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          ),
                        )
                        .toList(),
                onchanged: (value) {
                  dropdowncontroller.changethevaluebrand(value);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 340.w,
            child: TextFormField(
              controller: usercontroller.mobilename,

              decoration: InputDecoration(
                labelText: "Enter the Mobile name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 340.w,
            child: TextFormField(
              controller: usercontroller.colorcontroller,
              decoration: InputDecoration(
                labelText: "Enter the Color",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 340.w,
            child: TextFormField(
              controller: usercontroller.storagecontroller,
              decoration: InputDecoration(
                labelText: "Enter the Storage",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 340.w,
            child: TextFormField(
              controller: usercontroller.ramcontroller,
              decoration: InputDecoration(
                labelText: "Enter the Ram",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 340.w,
            child: DropdownWidget(
              hinttext: "Select the Condtion",
              items:
                  dropdowncontroller.condtionitems.map((items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
              onchanged: (value) {
                dropdowncontroller.changethevaluecondtion(value);
              },
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 150.w,
                  child: TextFormField(
                    controller: usercontroller.stockquantity,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: "item count",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 150.w,
                  child: TextFormField(
                    controller: usercontroller.pricecontroller,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: "PERPIECE ₹0",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
