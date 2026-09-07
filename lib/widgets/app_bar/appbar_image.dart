import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarImage({
    Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath!,
          height: height ?? 24.h,
          width: width ?? 24.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
