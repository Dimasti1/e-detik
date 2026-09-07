import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widgets/videolibrarysection_item_widget.dart';

class VideoPustakaScreen extends StatelessWidget {
  const VideoPustakaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 24.h,
                width: 26.h,
                margin: EdgeInsets.only(left: 28.h),
                onTap: () {
                  onTapImgArrowLeft(context);
                },
              ),
              SizedBox(height: 12.h),
              _buildVideoLibrarySection(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildVideoLibrarySection(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 14.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return VideolibrarysectionItemWidget();
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  void onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
