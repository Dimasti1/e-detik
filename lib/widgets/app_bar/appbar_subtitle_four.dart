import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarSubtitleFour extends StatelessWidget {
  final String text;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  AppbarSubtitleFour({
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
          style: CustomTextStyles.headlineSmallBold.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
