import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hapticadmin/widgets/appbar_custmized.dart';
import 'package:hapticadmin/widgets/drawer_custom.dart';

class SalesDashboard extends StatelessWidget {
  const SalesDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcustomized(title: "REVENUE & SALES"),
      drawer: DrawerCustom(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children:
                snapshot.data!.docs.map((documnet) {
                  return Center(child: Text(documnet["thumbnail"]));
                }).toList(),
          );
        },
      ),
    );
  }
}
