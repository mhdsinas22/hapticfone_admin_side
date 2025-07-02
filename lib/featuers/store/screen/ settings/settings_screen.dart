import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/alertdialog/brand_add_dIalog.dart';
import 'package:hapticadmin/common/common_controller/choicechip_controller.dart';
import 'package:hapticadmin/featuers/store/controllers/user_controller.dart';
import 'package:hapticadmin/featuers/store/models/brandmodels.dart';
import 'package:hapticadmin/common/widgets/appbar_custmized.dart';
import 'package:hapticadmin/common/widgets/drawer_custom.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final TextEditingController addbrand = TextEditingController();
  final chociechipcontroller = Get.put(Choicechipcontroller());
  final usercontroller = Get.find<Usercontroller>();
  @override
  Widget build(BuildContext context) {
    Brandmodels? selctedvalue;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () => BrandaddDialog.branddialog(context),
        child: Icon(Icons.add),
      ),
      drawer: DrawerCustom(),
      appBar: Appbarcustomized(title: "Settings"),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => DropdownButtonFormField(
                dropdownColor: Colors.white,
                value: selctedvalue,
                decoration: InputDecoration(border: OutlineInputBorder()),
                items:
                    chociechipcontroller.items.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(items.brandname),
                            // ignore: unrelated_type_equality_checks
                            if (chociechipcontroller.selectedindex.value !=
                                items)
                              IconButton(
                                onPressed:
                                    () => usercontroller.deletebrand(items.id),
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                          ],
                        ),
                      );
                    }).toList(),
                onChanged: (value) {},
                selectedItemBuilder:
                    (context) =>
                        chociechipcontroller.items.map((items) {
                          return Text(items.brandname);
                        }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
