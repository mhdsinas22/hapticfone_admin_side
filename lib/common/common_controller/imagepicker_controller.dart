import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hapticadmin/responsive/responsive_addproductscreen.dart';
import 'package:hapticadmin/utils%20/constants/keys.dart';

import 'package:http/http.dart' as http;

class Imagepickercontroller extends GetxController {
  static Imagepickercontroller get instance => Get.find();
  Rx<File?> selctedimage = Rx<File?>(null); // pickedimage ithlle declere avvum
  RxString uploadimageurl = "".obs; // cloudinaryke image url  stroe cheyynu]
  final RxList<String> uploadimagessssssulrl = <String>[].obs;
  final RxList<String> imagepatgs = <String>[].obs;
  List<PlatformFile>? selectedimages;

  // Step 1 Pick the image
  // void pickimage() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //     allowMultiple: true,
  //     withData: true,
  //   );
  //   if (result != null) {
  //     print("Reday?");
  //     final List<String> paths =
  //         result.files.map((file) => file.path!).toList();
  //     imagepatgs.assignAll(paths);
  //     selectedimages = result.files;
  //     print("imagepath:-$selectedimages");
  //     // selctedimage.value = File(result.files.single.path!);
  //     // imagepatgs.clear();
  //   }
  // }

  void pickimage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
      withData: true, // Web-il vendi
    );

    if (result != null) {
      selectedimages = result.files;

      if (kIsWeb) {
        // Web: no path, use names just for display
        imagepatgs.assignAll(selectedimages!.map((file) => file.name).toList());
      } else {
        // Android/iOS: path und
        imagepatgs.assignAll(
          selectedimages!.map((file) => file.path!).toList(),
        );
      }

      print("Selected files: $imagepatgs");
    }
  }

  // Step 2 image upload to cloudinary
  // Future<void> uploadimagetocloudinary() async {
  //   if (selectedimages == null) {
  //     return;
  //   }
  //   const cloudname = Keys.cloudname;
  //   const uploadprest = Keys.uploadpreset;
  //   final url = Uri.parse(
  //     "https://api.cloudinary.com/v1_1/$cloudname/image/upload",
  //   );
  //   for (var images in selectedimages!) {
  //     final request =
  //         http.MultipartRequest("POST", url)
  //           ..fields["upload_preset"] = uploadprest
  //           ..files.add(
  //             (await http.MultipartFile.fromPath("file", images.path!)),
  //           );
  //     final response = await request.send();
  //     if (response.statusCode == 200) {
  //       print("Success");
  //       Get.off(AddproductsScreen());
  //       final responsedata = await http.Response.fromStream(response);
  //       final data = jsonDecode(responsedata.body);
  //       // uploadimageurl.value = data["secure_url"];
  //       uploadimagessssssulrl.add(data["secure_url"]);
  //     } else {
  //       Get.snackbar("Upload Failed", "${response.statusCode}");
  //     }
  //   }
  // }

  Future<void> uploadimagetocloudinary() async {
    if (selectedimages == null) return;

    const cloudname = Keys.cloudname;
    const uploadprest = Keys.uploadpreset;
    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$cloudname/image/upload",
    );

    for (var image in selectedimages!) {
      final request = http.MultipartRequest("POST", url)
        ..fields["upload_preset"] = uploadprest;

      if (kIsWeb) {
        // 🌐 Web: Use fromBytes
        final multipartFile = http.MultipartFile.fromBytes(
          "file",
          image.bytes!,
          filename: image.name,
        );
        request.files.add(multipartFile);
      } else {
        // 📱 Android/iOS: Use fromPath
        final multipartFile = await http.MultipartFile.fromPath(
          "file",
          image.path!,
        );
        request.files.add(multipartFile);
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        print("Success");
        final responsedata = await http.Response.fromStream(response);
        final data = jsonDecode(responsedata.body);
        uploadimagessssssulrl.add(data["secure_url"]);

        // Move to next screen
        Get.off(ResponsiveAddproductscreen());
      } else {
        Get.snackbar("Upload Failed", "${response.statusCode}");
      }
    }
  }
}
