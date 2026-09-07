import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get openSans {
    return copyWith(fontFamily: 'Open Sans');
  }

  TextStyle get roboto {
    return copyWith(fontFamily: 'Roboto');
  }

  TextStyle get rubik {
    return copyWith(fontFamily: 'Rubik');
  }

  TextStyle get ubuntu {
    return copyWith(fontFamily: 'Ubuntu');
  }

  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }

  // ignore: unused_element
  TextStyle get montserrat {
    return copyWith(fontFamily: 'Montserrat');
  }

  TextStyle get poppins {
    return copyWith(fontFamily: 'Poppins');
  }
}

class CustomTextStyles {
  //body text style
  static TextStyle get bodyLargeBluegray300 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray300,
      );
  static TextStyle get bodyLargeInterGray50001 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
        fontSize: 16.fSize,
      );
  static TextStyle get bodyMedium13 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 13.fSize,
      );
  static TextStyle get bodyMedium15 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 15.fSize,
      );
  static TextStyle get bodyMediumGray800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray800,
        fontSize: 13.fSize,
      );
  static TextStyle get bodyMediumOnPrimary =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 15.fSize,
      );
  static TextStyle get bodyMediumOpenSans =>
      theme.textTheme.bodyLarge!.openSans.copyWith(
        fontSize: 15.fSize,
      );
  static TextStyle get bodyMediumPoppins =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        fontSize: 13.fSize,
      );
  static TextStyle get bodyMediumPoppins15 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        fontSize: 15.fSize,
      );
  static TextStyle get bodyMediumRubikGray500 =>
      theme.textTheme.bodyLarge!.rubik.copyWith(
        color: appTheme.gray500,
        fontSize: 13.fSize,
      );
  static TextStyle get bodyMediumRubikGray800 =>
      theme.textTheme.bodyLarge!.rubik.copyWith(
        color: appTheme.gray800,
        fontSize: 13.fSize,
      );
  static get bodySmallPoppins => theme.textTheme.bodySmall!.poppins;
  static TextStyle get bodySmallRubikGray600b2 =>
      theme.textTheme.bodyLarge!.rubik.copyWith(
        color: appTheme.gray600b2,
      );
  static TextStyle get bodySmallRubikGray800 =>
      theme.textTheme.bodyLarge!.rubik.copyWith(
        color: appTheme.gray800,
      );
  //display text style
  static TextStyle get displaySmallRed300 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.red300,
      );
  //headline text style
  static TextStyle get headlineLargeBold =>
      theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeUbuntu => theme.textTheme.headlineLarge!.ubuntu;
  static TextStyle get headlineSmallBold =>
      theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get headlineSmallBold_1 =>
      theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get headlineSmallRed300 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headlineSmallSemiBold =>
      theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  //label text style
  static TextStyle get labelSmallRed300 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.red300,
      );
  //title text style
  static TextStyle get titleLargeBlack => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w900,
      );
  static TextStyle get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleLargeOnErrorContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontWeight: FontWeight.w700,
      );  
  static TextStyle get titleLargePoppins =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleLargePoppinsOnPrimaryContainer =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleLargePoppinsRegular =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        fontWeight: FontWeight.w400,
      );  
  static TextStyle get titleLargeRed300 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleLargeRed300Black =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w900,
      );
  static TextStyle get titleLargeRed300Bold =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.red300,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleLargeRed300_1 =>
      theme.textTheme.titleLarge!.copyWith(color: appTheme.red300);
  static TextStyle get titleLargeRobotoOnPrimary =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleMediumBlack900 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get titleMediumInterBlack900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterGray900 =>
      theme.textTheme.titleMedium!.inter
          .copyWith(color: appTheme.gray900, fontWeight: FontWeight.w600);
  static TextStyle get titleMediumInterGray900SemiBold =>
      theme.textTheme.titleMedium!.inter
          .copyWith(color: appTheme.gray900, fontWeight: FontWeight.w600);
  static TextStyle get titleMediumInterIndigo300 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.indigo300,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleMediumInterPrimaryExtraBold =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get titleMediumInterPrimarySemiBold =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterPrimarySemiBold_1 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumInterRed300 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.red300,
      );
  static TextStyle get titleMediumPoppinsBlack900 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleMediumUbuntuPrimary =>
      theme.textTheme.titleMedium!.ubuntu.copyWith(
        color: theme.colorScheme.primary,
      );
  static TextStyle get titleSmallBlack900 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallBlack900Bold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallErrorContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static TextStyle get titleSmallGray50003 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50003,
      );
  static TextStyle get titleSmallGray50003_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50003,
      );
  static TextStyle get titleSmallPoppinsBlack900 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get titleSmallRoboto => theme.textTheme.titleSmall!.roboto;
  static TextStyle get titleSmallRobotoBluegray100 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.blueGray100,
        fontSize: 15.fSize,
      );
  static TextStyle get titleSmallRobotoErrorContainer =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static TextStyle get titleSmallRobotoGray50003 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.gray5003,
      );
  static TextStyle get titleSmallRobotoGray5003 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.gray5003,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallRobotoMedium =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallRobotoMedium15 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallRobotoRed300 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.red300,
      );
      static get titleSmallRoboto_1 => theme.textTheme.titleSmall!.roboto;
  static TextStyle get titleSmallRubikGray800 =>
      theme.textTheme.titleSmall!.rubik.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w500,
      );
  //ubuntu text style
  static TextStyle get ubuntuPrimary => TextStyle(
    color: theme.colorScheme.primary,
    fontWeight: FontWeight.w500,
  ).ubuntu;
}
