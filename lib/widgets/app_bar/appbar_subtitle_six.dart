import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarSubtitleSix extends StatelessWidget {
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarSubtitleSix({
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
        child: Text(
          text,
          style: CustomTextStyles.titleLargePoppinsRegular.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
