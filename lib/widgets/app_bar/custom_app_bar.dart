import 'package:flutter/material.dart';
import '../../core/app_export.dart';

enum Style { bgFillRed300_2, bgFillRed300_1, bgFillRed300 }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final ShapeBorder? shape;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  CustomAppBar({
    Key? key,
    this.height,
    this.shape,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 56.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 56.h,
      );

  Widget? _getStyle() {
    switch (styleType) {
      case Style.bgFillRed300_2:
        return Container(
          height: 80.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.red300,
          ),
        );
      case Style.bgFillRed300_1:
        return Container(
          height: 94.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.red300,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.h),
            ),
          ),
        );
      case Style.bgFillRed300:
        return Container(
          height: 112.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.red300,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40.h),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
