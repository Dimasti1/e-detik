import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class ArtikelScreen extends StatelessWidget {
  const ArtikelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppbar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 340.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgGambarartikel1,
                              height: 200.h,
                              width: double.maxFinite,
                              radius: BorderRadius.circular(10.h),
                              margin: EdgeInsets.only(right: 4.h),
                            ),
                            SizedBox(height: 4.h),
                            Padding(
                              padding: EdgeInsets.only(left: 2.h),
                              child: Text(
                                "Gesti Kuswandasari, Amd.Keb - RSUP Fatmawati Jakarta",
                                style: CustomTextStyles.bodySmallPoppins,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "Kehamilan Risiko Tinggi, Perlu Diwaspadai",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleSmallPoppinsBlack900.copyWith(
                                height: 1.10,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "lorem...",
                              maxLines: 19,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyMediumPoppins.copyWith(
                                height: 1.10,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "lorem..",
                              maxLines: 15,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyMediumPoppins.copyWith(
                                height: 1.10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 54.h,
      leadingWidth: 24.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 28.h),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  void onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
