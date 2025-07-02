import 'package:flutter/material.dart';
import 'package:hapticadmin/responsive/responsive_login_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(
        // ignore: use_build_context_synchronously
        context,
      ).pushReplacement(
        MaterialPageRoute(builder: (context) => ResponsiveLoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/iPhone 16 Pro - 1.png")),
    );
  }
}
