import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class ChipviewNormalItemWidget extends StatelessWidget {
  ChipviewNormalItemWidget({
    required this.onSelectedCallback,
    Key? key,
  }) : super(key: key);

  final Function(String) onSelectedCallback;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 26.h,
        vertical: 10.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Normal",
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.gray500.withOpacity(0.5),
      shadowColor: appTheme.black900.withOpacity(0.25),
      elevation: 2,
      selectedColor: theme.colorScheme.primary,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(20.h),
      ),
      onSelected: (value) {
        onSelectedCallback("Normal");
      },
    );
  }
}
