import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class TentangScreen extends StatelessWidget {
  const TentangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 42.h,
            top: 50.h,
            right: 42.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 56.h),
                child: Column(
                  children: [
                    Text(
                      "About",
                      style: CustomTextStyles.headlineSmallOnPrimaryContainer,
                    ),
                    SizedBox(height: 90.h),
                    CustomImageView(
                      imagePath: ImageConstant.imgImages1,
                      height: 268.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 4.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
