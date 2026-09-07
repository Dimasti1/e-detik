import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class VideolibrarysectionItemWidget extends StatelessWidget {

  const VideolibrarysectionItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img2024111831,
            height: 218.h,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 4.h),
          Text(
            "Insomnia Saat Hamil? Ini Solusi atasi Susah Tidur di Awal Kehamilan",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyMediumPoppins15.copyWith(
              height: 1.10,
            ),
          ),
        ],
      ),
    );
  }
}
