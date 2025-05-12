import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hapticadmin/repositry/user_repositry.dart';
import 'package:hapticadmin/screens/buy/addstock_page.dart';
import 'package:hapticadmin/widgets/subtitletext.dart';

class FetechdataDisplay extends StatelessWidget {
  const FetechdataDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final userreposity = Get.put(UserRepositry(), permanent: true);
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("products").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Column(
            children: [
              Center(
                child: Text(
                  "NO ITEMS ADD",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children:
                    snapshot.data!.docs.map((document) {
                      return Card(
                        elevation: 5,
                        shadowColor: Colors.black87,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        userreposity.deletetheproduct(
                                          document["id"],
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Get.to(
                                          AddstockPage(
                                            image: document["images"],
                                            editstrogae: document["stroage"],
                                            editstock: document["stock"],
                                            editram: document["ram"],
                                            editprice: document["price"],
                                            editmobilename:
                                                document["mobiletitle"],
                                            editcondion: document["condtion"],
                                            editbrand: document["brand"],
                                            editcolor: document["color"],
                                            editpage: true,
                                            id: document["id"],
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    SizedBox(width: 10.w),
                                  ],
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    document["thumbnail"],
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        document["mobiletitle"],
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Subtitletext(
                                        text: "Stroage:-${document["stroage"]}",
                                      ),
                                      Subtitletext(
                                        text:
                                            "Condtion:-${document["condtion"]}",
                                      ),
                                      Subtitletext(
                                        text: "Color:-${document["color"]}",
                                      ),
                                      Subtitletext(
                                        text: "PRICE:-${document["price"]}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 260.r,
                              bottom: 6.r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Subtitletext(
                                    text: "Item Count:-${document["stock"]}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
