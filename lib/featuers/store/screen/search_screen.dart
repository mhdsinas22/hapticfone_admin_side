import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hapticadmin/featuers/store/controllers/user_controller.dart';
import 'package:hapticadmin/common/widgets/serachtextfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(Usercontroller());
    return Scaffold(
      appBar: AppBar(
        title: SerachTextfiled(
          onchanged: (value) => usercontroller.serachuser(value),
          labeltext: "Search the Mobiles",
          prefix: Icon(Icons.search),
        ),
      ),
    );
  }
}
