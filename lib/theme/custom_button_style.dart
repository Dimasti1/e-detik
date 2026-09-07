import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillRed => ElevatedButton.styleFrom(
        backgroundColor: appTheme.red300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );
// Gradient button style
  static BoxDecoration get gradientGrayToGrayFDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular (14.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment (0.5, 0),
          end: Alignment (0.5, 1),
          colors: [appTheme.gray500.withOpacity (0.5), appTheme.gray5007f],
        ),
      );
  static BoxDecoration get gradientPinkToPinkDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        gradient: LinearGradient(
          begin: Alignment (0.0, 0),
          end: Alignment (1.0, 0),
          colors: [appTheme.pink10001, appTheme.pink50],
        ),
      );
  static BoxDecoration get gradientPinkToPinkTL16Decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        gradient: LinearGradient(
          begin: Alignment (0.5, 0),
          end: Alignment (0.5, 1),
          colors: [appTheme.pink300, appTheme.pink10002],
        ),
      );
  static BoxDecoration get gradientRedToPinkDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(14.h),
        border: GradientBoxBorder(
          width: 1.h,
          gradient: LinearGradient(
            begin: Alignment (0.5, 0),
            end: Alignment (0.5, 1),
            colors: [appTheme.red300, appTheme.pink100],
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment (0.5, 0),
          end: Alignment (0.5, 1),
          colors: [appTheme.red200, appTheme.pink10002],
        ),
      );
// Outline button style
  static ButtonStyle get outlineBlack => ElevatedButton.styleFrom(
        backgroundColor: appTheme.red300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.h),
        ),
        shadowColor: appTheme.black900.withOpacity (0.25),
        elevation: 4,
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get outlineBlackTL14 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.green4007f,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
        shadowColor: appTheme.black900.withOpacity (0.25),
        elevation: 4,
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get outlineBlackTL141 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray500.withOpacity (0.5),
        shape: RoundedRectangleBorder( 
          borderRadius: BorderRadius.circular(14.h), 
        ),
          shadowColor: appTheme.black900.withOpacity(0.25),
          elevation: 4,
          padding: EdgeInsets.zero,
      );
  static ButtonStyle get outlineBlackTL20 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray500.withOpacity (0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
        shadowColor: appTheme.black900.withOpacity (0.25),
        elevation: 4,
        padding: EdgeInsets.zero,
      );
  static ButtonStyle get outlineBlackTL26 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.h),
        ),
        shadowColor: appTheme.black900.withOpacity (0.25),
        elevation: 4,
        padding: EdgeInsets.zero,
      );
// text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color> (Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide (color: Colors.transparent),
        ));
}