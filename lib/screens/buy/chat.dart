import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hapticadmin/widgets/appbar_custmized.dart';
import 'package:hapticadmin/widgets/drawer_custom.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustomized(title: "CHATS"),
      drawer: DrawerCustom(),
      body: Center(
        child: IconButton(
          onPressed: () {
            FirebaseFirestore.instance.collection("productsdata").add({
              "title": "helaslj",
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
