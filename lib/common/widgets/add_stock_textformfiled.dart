import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/common_controller/choicechip_controller.dart';
import 'package:hapticadmin/common/common_controller/dropdown_controller.dart';
import 'package:hapticadmin/featuers/store/controllers/user_controller.dart';
import 'package:hapticadmin/featuers/store/models/brandmodels.dart';
import 'package:hapticadmin/utils%20/validator/validator.dart';
import 'package:hapticadmin/common/widgets/dropdown_widget.dart';

class Addstocktextformfiled extends StatelessWidget {
  const Addstocktextformfiled({
    super.key,
    required this.editcolor,
    this.editbrand = "",
    this.editcondion = "",
    this.editmobilename = "",
    this.editprice,
    this.editram = "",
    this.editstock,
    this.editstrogae = "",
    this.isweb = false,
  });
  final String editcolor;
  final String editbrand;
  final String editmobilename;
  final String editstrogae;
  final String editram;
  final String editcondion;
  final int? editstock;
  final double? editprice;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.find<Usercontroller>();
    final dropdowncontroller = Get.find<Dropdowncontroller>();
    final choicechipcontroller = Get.find<Choicechipcontroller>();
    usercontroller.colorcontroller.text = editcolor;
    usercontroller.pricecontroller.text = editprice.toString();
    usercontroller.mobilename.text = editmobilename;
    usercontroller.storagecontroller.text = editstrogae;
    usercontroller.ramcontroller.text = editram;
    usercontroller.stockquantity.text = editstock.toString();
    Brandmodels? selectedbrand = choicechipcontroller.items.firstWhereOrNull(
      (item) => item.brandname == editbrand,
    );
    if (selectedbrand != null) {
      dropdowncontroller.selectedvalue.value = selectedbrand;
    }
    dropdowncontroller.condtionselectedvalue.value = editcondion;
    return Form(
      key: usercontroller.formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 340.w,
              child: Obx(
                () => DropdownWidget<Brandmodels>(
                  validator:
                      (value) =>
                          Validator.checkdropdownemptytext("Brand", value),
                  value: dropdowncontroller.selectedvalue.value,
                  hinttext: "Select the Brand",
                  items:
                      choicechipcontroller.items
                          .map(
                            (items) => DropdownMenuItem(
                              value: items,
                              child: Text(items.brandname),
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
                validator:
                    (value) => Validator.checkemprytext("Mobile Name", value),
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
                validator: (value) => Validator.checkemprytext("Color", value),
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
                validator:
                    (value) => Validator.checkemprytext("Stroage", value),
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
                validator: (value) => Validator.checkemprytext("Ram", value),
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
                validator:
                    (value) => Validator.checkemprytext("Condtion", value),
                value:
                    dropdowncontroller.condtionselectedvalue.value.isEmpty
                        ? null
                        : dropdowncontroller.condtionselectedvalue.value,
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
                    height: isweb ? 50.h : null,
                    width: 150.w,
                    child: TextFormField(
                      validator:
                          (value) =>
                              Validator.checkemprytext("item Count", value),
                      controller: usercontroller.stockquantity,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: isweb ? 5.sp : 12.sp,
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
                    height: isweb ? 50.h : null,
                    width: 150.w,
                    child: TextFormField(
                      validator:
                          (value) =>
                              Validator.checkemprytext("Per PIECE", value),
                      controller: usercontroller.pricecontroller,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: isweb ? 5.sp : 12.sp,
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
      ),
    );
  }
}
