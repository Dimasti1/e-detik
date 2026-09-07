import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // D decorations
  static BoxDecoration get d4 => BoxDecoration(
    color: appTheme.blueGray10002,
  );

  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray10001,
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
  );
  static BoxDecoration get fillRed => BoxDecoration(
    color: appTheme.red300,
  );

  // Gradient decorations
  static BoxDecoration get gradientBlueToBlue => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.blue200, appTheme.blue50],
    ),
  );
  static BoxDecoration get gradientGrayToPrimary => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.gray300, theme.colorScheme.primary],
    ),
  );
  static BoxDecoration get gradientGreenAToCyan => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.greenA100, appTheme.cyan50],
    ),
  );
  static BoxDecoration get gradientOrangeToOrange => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.orange200, appTheme.orange50],
    ),
  );
  static BoxDecoration get gradientPinkToPink => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.pink300, appTheme.pink10002],
    ),
  );
  static BoxDecoration get gradientPrimaryToGray => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [theme.colorScheme.primary, appTheme.gray50],
    ),
  );
  static BoxDecoration get gradientPurpleToPurple => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.purple100, appTheme.purple50],
    ),
  );
  static BoxDecoration get gradientRedToDeepOrange => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.red100, appTheme.deepOrange50],
    ),
  );
  static BoxDecoration get gradientRedToPink => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.red200, appTheme.pink10002],
    ),
  );
  static BoxDecoration get gradientRedToPink10002 => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(0.5, 1),
      colors: [appTheme.red300, appTheme.pink10002],
    ),
  );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
    color: theme.colorScheme.primary,
    border: Border.all(
      color: appTheme.gray30001,
      width: 1.h,
    ),
  );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderBL10 => BorderRadius.vertical(
    bottom: Radius.circular(10.h),
  );
  static BorderRadius get customBorderTL10 => BorderRadius.vertical(
    top: Radius.circular(10.h),
  );
  static BorderRadius get customBorderTL40 => BorderRadius.only(
    topLeft: Radius.circular(40.h),
    topRight: Radius.circular(40.h),
    bottomLeft: Radius.circular(10.h),
    bottomRight: Radius.circular(10.h),
  );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(10.h);
  static BorderRadius get roundedBorder16 => BorderRadius.circular(16.h);
}
