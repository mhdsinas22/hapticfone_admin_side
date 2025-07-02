import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';

import 'package:hapticadmin/utils%20/constants/images_strings.dart';

import 'package:lottie/lottie.dart';

class Sellhomescreen extends StatelessWidget {
  const Sellhomescreen({super.key, this.isweb = false});
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        title: Boldtext(text: "COMING SOON", size: 20.sp),
        centerTitle: true,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(20.h),
      //     child: Container(color: Colors.black, height: 1.h),
      //   ),
      //   title: Center(
      //     child:
      //         isweb
      //             ? Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 InkWell(
      //                   // onTap: () => Get.offAll(() => ResnpovseHomeScreen()),
      //                   child: TextbuttonCustomized(
      //                     width: 30,
      //                     text: "Buy",
      //                     onpressed:
      //                         () => Get.offAll(() => ResnpovseHomeScreen()),
      //                     textStyle: TextStyle(
      //                       color: Appcolors.black,
      //                       fontSize: 8.sp,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                     boxDecoration: BoxDecoration(
      //                       color: Appcolors.appgrey,
      //                       borderRadius: BorderRadius.circular(30),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(width: 10),
      //                 InkWell(
      //                   onTap: () => {},
      //                   child: TextbuttonCustomized(
      //                     width: 30,
      //                     text: "Sell",
      //                     onpressed: () {},
      //                     textStyle: TextStyle(
      //                       color: Appcolors.white,
      //                       fontSize: 8.sp,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                     boxDecoration: BoxDecoration(
      //                       color: Appcolors.appbuttongreen,
      //                       borderRadius: BorderRadius.circular(30),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             )
      //             : Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 CustomElveationbutton(
      //                   text: "Buy",
      //                   onPressed: () {
      //                     Get.off(CustomBottomnavgtionbarhome());
      //                   },
      //                   backgroundcolor: Colors.grey[400],
      //                   forgroundcolor: Colors.black,
      //                 ),
      //                 SizedBox(width: 10),
      //                 CustomElveationbutton(
      //                   text: "Sell",
      //                   onPressed: () {},
      //                   backgroundcolor: Appcolors.appbuttongreen,
      //                   forgroundcolor: Colors.white,
      //                 ),
      //               ],
      //             ),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAnimatons.workinganimatinblackcolor),
            SizedBox(height: 10),
            Text(
              "Selling made easy — Coming Soon!",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     SizedBox(height: 10.h),
      //     SerachTextfiled(
      //       labeltext: "Search the Phone",
      //       prefix: Icon(Icons.search),
      //     ),
      //     Image.asset("asset/WhatsApp Image 2025-04-07 at 15.36.44.jpeg"),
      //     Expanded(
      //       child: Column(
      //         children: [
      //           Text(
      //             "Got an old Phone? Want Ready Cash Today",
      //             style: TextStyle(
      //               color: Colors.grey,
      //               fontSize: 30.sp,
      //               fontWeight: FontWeight.w700,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
    );
  }
}
