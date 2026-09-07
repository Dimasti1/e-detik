import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/app_export.dart';

// ignore_for_file: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    Key? key,
    this.controller,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(key: key);

  final Alignment? alignment;
  final BuildContext context;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 4,
        keyboardType: TextInputType.number,
        textStyle: textStyle ?? CustomTextStyles.ubuntuPrimary,
        hintStyle: hintStyle ?? CustomTextStyles.ubuntuPrimary,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 56.h,
          fieldWidth: 56.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(26.h),
          inactiveColor: appTheme.gray300,
          activeColor: appTheme.gray300,
          inactiveFillColor: Colors.transparent,
          activeFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          selectedColor: appTheme.gray300,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
