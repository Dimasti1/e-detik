import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarSubtitleSeven extends StatelessWidget {
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarSubtitleSeven({
    Key? key,
    required this.text,
    this.onTap,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: SizedBox(
          width: 180.h,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodySmallRubikGray800.copyWith(
              color: appTheme.gray800,
              height: 1.50,
            ),
          ),
        ),
      ),
    );
  }
}
