import 'package:edetik/presentation/pustaka_screen/widgets/educationlist_item_widget1.dart';
import 'package:edetik/presentation/pustaka_screen/widgets/educationlist_item_widget2.dart';
import 'package:edetik/presentation/pustaka_screen/widgets/educationlist_item_widget3.dart';
import 'package:edetik/presentation/pustaka_screen/widgets/wajib_ibuhamil1.dart';
import 'package:edetik/presentation/pustaka_screen/widgets/wajib_ibuhamil2.dart';
import 'package:edetik/presentation/pustaka_screen/widgets/wajib_ibuhamil3.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widgets/educationlist_item_widget.dart';

class PustakaScreen extends StatelessWidget {
  PustakaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Pustaka"),
          leadingWidth: 56.h,
          backgroundColor: appTheme.red300,
          leading: Padding(
            padding: EdgeInsets.only(left: 27.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.0),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [theme.colorScheme.primary, appTheme.gray50],
            ),
          ),
          child: Container(
            // margin: EdgeInsets.only(top: 72.h),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.img20241118,
                      height: 230.h,
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 28.h),
                    SizedBox(
                      width: 326.h,
                      child: Text(
                        "Edukasi Kehamilan Resiko Tinggi (ResTi) UPTD. Puskesmas Ambulu",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          height: 1.39,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 360.h,
                        margin: EdgeInsets.only(left: 17.h, right: 17.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildMenuSection(context),
                            SizedBox(height: 26.h),
                            _buildMenuSection1(context),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // bottomNavigationBar: _buildAvoidFoodColumn(context),
      ),
    );
  }

  /// AppBar Widget
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return CustomAppBar(
  //     height: 72.h,
  //     leadingWidth: 24.h,
  //     leading: AppbarLeadingImage(
  //       imagePath: ImageConstant.imgArrowLeftPrimary,
  //       margin: EdgeInsets.only(left: 24.h),
  //       onTap: () {
  //         onTapArrowLeft(context);
  //       },
  //     ),
  //     title: AppbarSubtitleTwo(
  //       text: "Pustaka",
  //       margin: EdgeInsets.only(left: 12.h),
  //     ),
  //     styleType: Style.bgFillRed300_1,
  //   );
  // }

  Widget _buildMenuSection(BuildContext context) {
    final menuItems = [
      EducationlistItemWidget(
        onTapStackImage: () {},
        onTapImgImage: () {},
      ),
      EducationlistItemWidget1(
        onTapStackImage: () {},
        onTapImgImage: () {},
      ),
      EducationlistItemWidget2(
        onTapStackImage: () {},
        onTapImgImage: () {},
      ),
      EducationlistItemWidget3(
        onTapStackImage: () {},
        onTapImgImage: () {},
      )
    ];

    return Container(
      width: double.maxFinite,
      // margin: EdgeInsets.only(left: 5.h, right: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sulit tidur?",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallPoppinsBlack900
                      .copyWith(height: 1.20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 23.h,
              children: menuItems,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuSection1(BuildContext context) {
    final menuItems = [
      wajibIbuHamil1(
        onTapStack1: () {},
        onTapImg1: () {},
      ),
      wajibIbuHamil2(
        onTapStack1: () {},
        onTapImg1: () {},
      ),
      wajibIbuHamil3(
        onTapStack1: () {},
        onTapImg1: () {},
      ),
    ];
    return Container(
      width: double.maxFinite,
      // margin: EdgeInsets.only(left: 5.h, right: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wajib untuk ibu hamil",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallPoppinsBlack900
                      .copyWith(height: 1.20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 23.h,
              children: menuItems,
            ),
          )
        ],
      ),
    );
  }

  /// Education List Widget
  Widget _buildEducationList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
          direction: Axis.horizontal,
          spacing: 36.h,
          children: List.generate(4, (index) {
            return EducationlistItemWidget();
          })),
    );
  }

  /// Image List Widget
  // Widget _buildImageList(BuildContext context) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Wrap(
  //       direction: Axis.horizontal,
  //       spacing: 36.h,
  //       children: List.generate(
  //         3,
  //         (index) {
  //           return ImagelistItemWidget();
  //         },
  //       ),
  //     ),
  //   );
  // }

  /// Mandatory Food Row Widget
  // Widget _buildMandatoryFoodRow(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: SizedBox(
  //       width: double.maxFinite,
  //       child: Row(
  //         children: [
  //           SizedBox(
  //             width: 160.h,
  //             child: Column(
  //               children: [
  //                 CustomImageView(
  //                   imagePath: ImageConstant.img2024111821,
  //                   height: 100.h,
  //                   width: double.maxFinite,
  //                   radius: BorderRadius.vertical(
  //                     top: Radius.circular(10.h),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: double.maxFinite,
  //                   padding: EdgeInsets.symmetric(vertical: 10.h),
  //                   decoration: BoxDecoration(
  //                     color: theme.colorScheme.primary,
  //                     borderRadius: BorderRadiusStyle.customBorderBL10,
  //                   ),
  //                   child: Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Text(
  //                         "Makanan Wajib Saat Hamil, agar Janin Cerdas!",
  //                         style: theme.textTheme.bodySmall,
  //                       ),
  //                       SizedBox(height: 26.h),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Spacer(),
  //           // _buildImageList(context),
  //           //??
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// Avoid Food Column Widget
  // Widget _buildAvoidFoodColumn(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     padding: EdgeInsets.only(right: 4.h),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(bottom: 12.h),
  //           padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.h),
  //           decoration: BoxDecoration(
  //             color: theme.colorScheme.primary,
  //             borderRadius: BorderRadiusStyle.customBorderBL10,
  //           ),
  //           child: Text(
  //             "Makanan Yang wajib dihindari ibu hamil!",
  //             style: theme.textTheme.bodySmall,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Navigate back
  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigate to videoPustakaScreen
  void onTapImgImage(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.videoPustakaScreen);
  }
}
