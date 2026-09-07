import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class ListPustakaiItemWidget extends StatelessWidget {
  ListPustakaiItemWidget({
    Key? key,
    this.onTapStackPustaka,
    this.onTapImgPustaka,
  }) : super(key: key);

  final VoidCallback? onTapStackPustaka;
  final VoidCallback? onTapImgPustaka;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 94.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: GestureDetector(
              onTap: () {
                onTapStackPustaka?.call();
              },
              child: Container(
                height: 94.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                  gradient: LinearGradient(
                    begin: Alignment(0.5, 0),
                    end: Alignment(0.5, 1),
                    colors: [appTheme.red100, appTheme.deepOrange50],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgMultimedia2,
                      height: 84.h,
                      width: 86.h,
                      radius: BorderRadius.circular(10.h),
                      onTap: () {
                        onTapImgPustaka?.call();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "Pustaka",
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumOpenSans,
            ),
          ),
        ],
      ),
    );
  }
}
