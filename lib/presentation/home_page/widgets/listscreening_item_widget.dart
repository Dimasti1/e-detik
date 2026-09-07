import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class ListscreeningItemWidget extends StatelessWidget {
  ListscreeningItemWidget({
    Key? key,
    this.onTapStackscreening,
    this.onTapImgScreeningOne,
  }) : super(key: key);

  final VoidCallback? onTapStackscreening;
  final VoidCallback? onTapImgScreeningOne;

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
                onTapStackscreening?.call();
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
                      imagePath: ImageConstant.imgCheck,
                      height: 84.h,
                      width: 86.h,
                      radius: BorderRadius.circular(10.h),
                      onTap: () {
                        onTapImgScreeningOne?.call();
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
              "Screening",
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumOpenSans,
            ),
          ),
        ],
      ),
    );
  }
}
