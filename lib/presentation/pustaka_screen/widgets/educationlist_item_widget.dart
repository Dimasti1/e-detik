import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class EducationlistItemWidget extends StatelessWidget {
  EducationlistItemWidget({
    Key? key,
    this.onTapStackImage,
    this.onTapImgImage,
  }) : super(key: key);

  final VoidCallback? onTapStackImage;
  final VoidCallback? onTapImgImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.h,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: GestureDetector(
              onTap: () {
                onTapStackImage?.call();
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgtidur1,
                height: 100.h,
                width: double.maxFinite,
                radius: BorderRadius.vertical(
                  top: Radius.circular(10.h),
                ),
                onTap: () {
                  onTapImgImage?.call();
                },
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadiusStyle.customBorderBL10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lakukan Ini Agar Tidur Nyenyak saat Hamil!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall!.copyWith(
                    height: 1.50,
                  ),
                ),
                SizedBox(height: 42.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
