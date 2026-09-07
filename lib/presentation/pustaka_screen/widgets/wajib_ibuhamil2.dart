import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class wajibIbuHamil2 extends StatelessWidget {
  wajibIbuHamil2({Key? key, this.onTapImg1, this.onTapStack1})
      : super(
          key: key,
        );
  final VoidCallback? onTapStack1;
  final VoidCallback? onTapImg1;

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
                onTapStack1?.call();
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgibuhamil2,
                height: 100.h,
                width: double.maxFinite,
                radius: BorderRadius.vertical(
                  top: Radius.circular(10.h),
                ),
                onTap: () {
                  onTapImg1?.call();
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
                  "Makanan yang Wajib Dihindari Ibu Hamil!",
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
