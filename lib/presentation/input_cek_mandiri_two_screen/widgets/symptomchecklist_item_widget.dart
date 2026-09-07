import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class SymptomChecklistItemWidget extends StatelessWidget {
  SymptomChecklistItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Apakah Ibu merasakan demam lebih dari 2 hari?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumOnPrimary,
            ),
          ),
            CustomImageView(
              imagePath: ImageConstant.imgCheckmarkGreenA700,
              height: 40.h,
              width: 42.h,
            ),
          SizedBox(width: 16.h),
          CustomIconButton(
            height: 44.h,
            width: 44.h,
            padding: EdgeInsets.all(4.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(
              imagePath: ImageConstant.imgClosePrimarycontainer,
            ),
          ),
        ],
      ),
    );
  }
}
