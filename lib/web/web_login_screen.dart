import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/featuers/authencation/controllers/logincontroller.dart';
import 'package:hapticadmin/common/widgets/customtextbuttom.dart';
import 'package:hapticadmin/featuers/notfication/controller/notifcationController.dart';

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logincortroller = Get.put(Logincontroller(), permanent: true);
    Get.put(
      Notifcationcontroller(),
      permanent: true,
    ); // 🔥 token save cheyyan controller

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: logincortroller.loginformkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/Haptic Fone Logo-14.png", width: 100.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "USERNAME",
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
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
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
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
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextbuttonCustomized(
                    text: "Login",
                    textStyle: TextStyle(
                      fontSize: 5.sp,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
