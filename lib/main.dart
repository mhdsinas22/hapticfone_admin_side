import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hapticadmin/firebase_options.dart';
import 'package:hapticadmin/screens/splashscreen.dart';

Future<void> main() async {
  // Widget Binding
  WidgetsFlutterBinding.ensureInitialized();
  //cloudinary intial context
  CloudinaryObject.fromCloudName(cloudName: "dyliko3a1");
  await dotenv.load(fileName: ".env");
  // intialzise the firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          home: Splashscreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
