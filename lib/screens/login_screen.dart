import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:hapticadmin/controllers/logincontroller.dart';
import 'package:hapticadmin/widgets/customtextbuttom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logincortroller = Get.put(Logincontroller(), permanent: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: logincortroller.loginformkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/Haptic Fone Logo-14.png"),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Text(
                      "USERNAME",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: logincortroller.username,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required the Username";
                    } else if (value != "admin") {
                      return "Wrong the Username";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 50.h),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  obscureText: true,
                  controller: logincortroller.password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required the Password";
                    } else if (value != "admin") {
                      return "Wrong the Password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 50.h),
                TextbuttonCustomized(
                  text: "Login",
                  textStyle: TextStyle(
                    fontSize: 19.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  onpressed: () => logincortroller.login(),
                  width: 333,
                  heigth: 41,
                  boxDecoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
