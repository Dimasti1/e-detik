import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  var _appTheme = PrefUtils().getThemeData();

  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  Map<String, ColorScheme> _supportedCustomScheme = {
    'lightCode': CostumColorScheme.lightCodeColorScheme
  };  

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedCustomScheme[_appTheme] ?? CostumColorScheme.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appTheme.red300,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.black900,
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 18.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 36.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 32.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 9.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      );
}

class CostumColorScheme {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xffffffff),
    primaryContainer: Color(0xfff92222),
    secondaryContainer: Color(0x7fffffff),
    errorContainer: Color(0xffb3b3b3),
    onErrorContainer: Color(0xff1e1b39),
    onPrimary: Color(0xff333333),
    onPrimaryContainer: Color(0xff0e0e0e),
  );
}

class LightCodeColors {
  //black
  Color get black900 => Color(0xff000000);
  //blue
  Color get blue200 => Color(0xffa8c5ff);
  Color get blue50 => Color(0xffd3e1ff);
  //bluegray
  Color get blueGray100 => Color(0xffd9d8d8);
  Color get blueGray10001 => Color(0xffd9d9d9);
  Color get blueGray10002 => Color(0xffd4d4d4);
  Color get blueGray10003 => Color(0xffd8d8d8);
  Color get blueGray300 => Color(0xff8696bb);
  Color get blueGray500 => Color(0xff667085);
  Color get blueGray600 => Color(0xff615e82);
  Color get blueGray700 => Color(0xff475569);
  //cyan
  Color get cyan50 => Color(0xffe4fff8);
  //deeporange
  Color get deepOrange50 => Color(0xffffe6e6);
  //deeppurple
  Color get deepPurpleA200 => Color(0xff952cff);
  //gray
  Color get gray100 => Color(0xfff5f5f5);
  Color get gray300 => Color(0xffe1e1e1);
  Color get gray30001 => Color(0xffdadada);
  Color get gray50 => Color(0xfffff7f8);
  Color get gray500 => Color(0xffaaaaaa);
  Color get gray50001 => Color(0xff9290a4);
  Color get gray50002 => Color(0xff9e9e9e);
  Color get gray50003 => Color(0xff989898);
  Color get gray5001 => Color(0xfff8f8f8);
  Color get gray5002 => Color(0xfffafafa);
  Color get gray5003 => Color(0xfffffef6);
  Color get gray800 => Color(0xff573926);
  Color get gray900 => Color(0xff2a2a2a);
  //grayf
  Color get gray5007f => Color(0x7fb1a3a3);
  //grayb
  Color get gray600b2 => Color(0xb26f6f6f);
  //greenf
  Color get green4007f => Color(0x7f52e466);
  //green
  Color get greenA100 => Color(0xffbfffda);
  Color get greenA700 => Color(0xff00f520);
  //indigo
  Color get indigo300 => Color(0xff648ddb);
  Color get indigo50 => Color(0xffffebd2);
  //orange
  Color get orange200 => Color(0xffffc175);
  Color get orange50 => Color(0xffffebd2);
  //pink
  Color get pink100 => Color(0xfff2b5be);
  Color get pink10001 => Color(0xfffec2cb);
  Color get pink10002 => Color(0xffffb6c1);
  Color get pink200 => Color(0xfffea6b3);
  Color get pink300 => Color(0xfffa6f84);
  Color get pink50 => Color(0xfffee3e7);
  Color get pink5001 => Color(0xfffde2e6);
  //purple
  Color get purple100 => Color(0xffeda8ff);
  Color get purple50 => Color(0xffeed3ff);
  //red
  Color get red100 => Color(0xffffdbce);
  Color get red200 => Color(0xfffc91a1);
  Color get red300 => Color(0xffee6176);
}
