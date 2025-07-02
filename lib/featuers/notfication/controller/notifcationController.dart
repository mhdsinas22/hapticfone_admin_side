import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/orders.dart';
// import 'package:hapticadmin/featuers/store/screen/buy/orders_screen/orders.dart';

class Notifcationcontroller extends GetxController {
  static Notifcationcontroller get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    firebasemessings();
    print("FEYSKHAFNOTFICSAION");
    saveAdminToken();
    handleTokenRefresh();
    listenToMessages();

    // print(" TOKEN ISN${tokenns}");
  }

  String? tokenns = "";
  Future<void> firebasemessings() async {
    print("DFUNCtioN WOKRINF");
    // firebase messing inintai
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    // FCM TOKEN
    String? token = await messaging.getToken();
    tokenns = token;
    print("TOKEN IS $token");
    if (token == null) {
      print("❌ Token not received. Check internet and Firebase config.");
    }
    // App is not close but is  in background
    FirebaseMessaging.onMessage.listen((RemoteMessage messege) {});
    // App is in termnation state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        message.notification?.title ?? "N/A";
        message.notification?.body ?? "N/A";
        Get.to(Orders());
      }
    });
  }

  Future<void> saveAdminToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await FirebaseFirestore.instance.collection("Tokens").doc("admin").set({
        "token": token,
      });
      print('Admin Token Saved: $token');
    }
  }

  void handleTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      FirebaseFirestore.instance.collection("Tokens").doc("admin").set({
        "token": newToken,
      });
      print("🔁 Token refreshed: $newToken");
    });
  }

  void listenToMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
        "📥 Notification received (foreground): ${message.notification?.title}",
      );
      // You can also show a snackbar or dialog here
    });
  }
}
