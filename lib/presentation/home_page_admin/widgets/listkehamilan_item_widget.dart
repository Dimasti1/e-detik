import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
@immutable
class ListkehamilanItemWidget extends StatelessWidget {
  ListkehamilanItemWidget({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 202.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGambarartikel1,
            height: 130.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(10.h),
          ),
          SizedBox(height: 14.h),
          Text(
            "Kehamilan Risiko Tinggi, Perlu Diwaspadai",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyMediumPoppins15.copyWith(
              height: 1.10,
            ),
          )
        ],
      ),
    );
  }
}
