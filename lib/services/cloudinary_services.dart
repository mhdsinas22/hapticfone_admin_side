// upload file to cloudnary
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

Future<bool> uploadfiletocloudinary(FilePickerResult? filepickerresult) async {
  if (filepickerresult == null || filepickerresult.files.isEmpty) {
    print("No FIle Selected");
    return false;
  }
  // it convert to filepicker result to file
  File file = File(filepickerresult.files.single.path!);
  // now read the cloudinary cloudname
  String cloudname = dotenv.env["CLOUDINARY_CLOUDNAME"] ?? "";

  // Create to multipart requst to upload file to cloudinary
  var uri = Uri.parse(
    "https://api.cloudinary.com/v1_1/$cloudname/image/upload",
  );
  // ith serever ille upload cheyynnu
  var request = http.MultipartRequest("POST", uri);
  var filebytes = await file.readAsBytes();
  var multipartFile = http.MultipartFile.fromBytes(
    "file", //the form field name for the file
    filebytes,
    filename: file.path.split("/").last, //the file name to send in the request
  );
  //Add the file part to the request
  request.files.add(multipartFile);

  request.fields["upload_preset"] = "upolad_images_ecomoerce";
  request.fields["resource_type"] = "image";
  // Send the request and await the respnse
  var respnse = await request.send();
  var respnsobebody = await respnse.stream.bytesToString();
  print(respnsobebody);
  if (respnse.statusCode == 200) {
    print("Suucsufullupload");
    return true;
  } else {
    print("falid${respnse.statusCode}");
    return false;
  }
}
