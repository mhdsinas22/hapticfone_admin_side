import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/common/alertdialog/alert_dialogg.dart';
import 'package:hapticadmin/common/container/rectangle_contianer.dart';
import 'package:hapticadmin/common/widgets/cached_Network_image_Custom.dart';
import 'package:hapticadmin/common/widgets/subtitletext.dart';
import 'package:hapticadmin/datas/repositry/user_repositry.dart';
import 'package:hapticadmin/featuers/store/controllers/serachcontroller.dart';
import 'package:hapticadmin/featuers/store/screen/buy/products_screen/addstock_page.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';
import 'package:hapticadmin/utils%20/constants/boldtext.dart';
import 'package:hapticadmin/web/web_addstock_screen.dart';

class FetechdataDisplay extends StatelessWidget {
  const FetechdataDisplay({super.key, this.isweb = false});
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final userreposity = Get.put(UserRepositry());
    final serachcontroller = Get.put(Serachcontroller());
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Obx(() {
          var items = serachcontroller.filteditems;
          if (serachcontroller.isloading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (serachcontroller.haserror.value) {
            return Center(child: Text("😢 No Internet Connection"));
          }
          if (items.isEmpty) {
            return Center(
              child: Text(
                "NO ITEMS ADD",
                style: TextStyle(
                  fontSize: isweb ? 10.sp : 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListView.builder(
              itemCount: serachcontroller.filteditems.length,
              itemBuilder: (context, index) {
                var document = serachcontroller.filteditems[index];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 5,
                        shadowColor: Colors.black87,
                        color: Appcolors.white,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed:
                                          () => Alertdialogg(
                                            context: context,
                                            titletext: "Confirm Delete",
                                            leftsidetext: "Cancel",
                                            rightsidetext: "Delete",
                                            onpressd:
                                                () => userreposity
                                                    .deletetheproduct(
                                                      document["id"],
                                                    ),
                                          ).showalertlog(isweb),
                                      icon: Icon(Icons.delete),
                                      color: Colors.red,
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        Get.to(
                                          isweb
                                              ? WebAddstockPage(
                                                editpage: true,
                                                image: document["images"],
                                                editstrogae:
                                                    document["stroage"],
                                                editstock: document["stock"],
                                                editram: document["ram"],
                                                editprice: document["price"],
                                                editmobilename:
                                                    document["mobiletitle"],
                                                editcondion:
                                                    document["condtion"],
                                                editbrand: document["brand"],
                                                editcolor: document["color"],

                                                id: document["id"],
                                              )
                                              : AddstockPage(
                                                image: document["images"],
                                                editstrogae:
                                                    document["stroage"],
                                                editstock: document["stock"],
                                                editram: document["ram"],
                                                editprice: document["price"],
                                                editmobilename:
                                                    document["mobiletitle"],
                                                editcondion:
                                                    document["condtion"],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      return RectangleContainer(
                                        width: 80,
                                        heigth: 80,
                                        child: CachedNetworkImageCustom(
                                          imageurl: document["thumbnail"],
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    },
                                  ),
                                  RectangleContainer(
                                    width: 150,
                                    heigth: isweb ? 120 : 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Boldtext(
                                          text: document["mobiletitle"],
                                          size: isweb ? 5 : 15,
                                        ),
                                        Subtitletext(
                                          text:
                                              "Condtion:-${document["condtion"]}",
                                          fontsize: isweb ? 4 : 12,
                                        ),
                                        Subtitletext(
                                          text:
                                              "Stroage:-${document["stroage"]}",
                                          fontsize: isweb ? 4 : 12,
                                        ),
                                        Subtitletext(
                                          text: "Price:-${document["price"]}",
                                          fontsize: isweb ? 4 : 12,
                                        ),
                                        Subtitletext(
                                          text: "Color:-${document["color"]}",
                                          fontsize: isweb ? 4 : 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Positioned(
                              left: isweb ? 1280.r : 240.r,
                              bottom: isweb ? 10.r : 6.r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Subtitletext(
                                    text: "Item Count:-${document["stock"]}",
                                    fontsize: isweb ? 4 : 12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
