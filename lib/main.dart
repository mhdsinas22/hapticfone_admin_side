import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hapticadmin/bindings/bindings.dart';
import 'package:hapticadmin/firebase_options.dart';
import 'package:hapticadmin/responsive/responsive_splash_screen.dart';

Future<void> _backgroudmessing(RemoteMessage message) async {}
Future<void> main() async {
  // Widget Binding
  WidgetsFlutterBinding.ensureInitialized();
  //cloudinary intial context
  CloudinaryObject.fromCloudName(cloudName: "dyliko3a1");
  await dotenv.load(fileName: ".env");
  // intialzise the firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_backgroudmessing);
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: InitialBindings(),
          home: ResponsiveSplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
