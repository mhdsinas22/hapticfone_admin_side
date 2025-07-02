import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/responsive/respnsive_home_screen.dart';

class Logincontroller extends GetxController {
  static Logincontroller get instance => Get.find();
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  void login() {
    if (!loginformkey.currentState!.validate()) {
      return;
    }
    // You can add more logic here like checking username/password match
    if (username.text != "admin" || password.text != "admin") {
      Get.snackbar("Login Failed", "Incorrect username or password");
      return;
    }

    Get.offAll(() => RespnsiveHomeScreen());
  }
}
