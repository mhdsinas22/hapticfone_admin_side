import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticadmin/utils%20/constants/appcolors.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  const CachedNetworkImageCustom({
    super.key,
    required this.imageurl,
    this.width = 100,
    this.heigth = 100,
    this.fit,
    this.circularcolr = Appcolors.black,
  });
  final String imageurl;
  final double width;
  final double heigth;
  final BoxFit? fit;
  final Color circularcolr;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width.w,
      height: heigth.w,
      imageUrl: imageurl,
      fit: fit,
      placeholder:
          (context, url) => Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: circularcolr,
                strokeWidth: 2.0,
              ),
            ),
          ),
      errorWidget:
          (context, url, error) => Icon(Icons.error, color: Colors.red),
    );
  }
}
