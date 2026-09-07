import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class UbahKataSandiScreen extends StatelessWidget {
  UbahKataSandiScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController fieyeoffoneController = TextEditingController();
  TextEditingController fieyeofftwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.red300,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 26.h, top: 46.h, right: 26.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Atur Password baru",
                    style: CustomTextStyles.headlineSmallSemiBold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "msg_buat_kata_sandi",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallRobotoMedium15,
                ),
                SizedBox(height: 42.h),
                _buildPasswordInput(context),
                SizedBox(height: 14.h),
                _buildConfirmPasswordInput(context),
                SizedBox(height: 68.h),
                CustomElevatedButton(
                  text:
                      "Buat kata sandi baru, pastikan berbeda dari yang sebelumnya untuk keamanan",
                  margin: EdgeInsets.only(left: 2.h, right: 4.h),
                  buttonTextStyle: CustomTextStyles.titleLargeRed300Bold,
                  onPressed: () {
                    // Handle the password change logic here
                    NavigatorService.popAndPushNamed(
                      AppRoutes.konfirmasiSandiBerhasilDiubahScreen,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget for AppBar
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 51.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 27.h),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
    );
  }

  /// Section Widget for Password Input
  Widget _buildPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: fieyeofftwoController,
      hintText: "Masukkan Kata Sandi",
      hintStyle: CustomTextStyles.titleMediumInterPrimarySemiBold,
      textInputType: TextInputType.visiblePassword,
      suffix: Container(
        // onTap: () {
        //   context.read<UbahKataSandiBloc>().add(
        //         ChangePasswordVisibilityEvent(value: !state.isShowPassword),
        //       );
        // },
        margin: EdgeInsets.fromLTRB(26.h, 14.h, 16.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgFieyeoff,
          height: 20.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: 54.h),
      obscureText: true,
      contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
      validator: (value) {
        if (value == null || !isValidPassword(value, isRequired: true)) {
          return "err_msg_please_enter_valid_password";
        }
        return null;
      },
    );
  }

  /// Section Widget for Confirm Password Input
  Widget _buildConfirmPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: fieyeoffoneController,
      hintText: "Ulangi Kata Sandi",
      hintStyle: CustomTextStyles.titleMediumInterPrimarySemiBold,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(26.h, 14.h, 16.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgFieyeoff,
          height: 20.h,
          width: 20.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: 54.h),
      obscureText: true,
      contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
      validator: (value) {
        if (value == null || !isValidPassword(value, isRequired: true)) {
          return "err_msg_please_enter_valid_password";
        }
        return null;
      },
    );
  }

  /// Navigates to the previous screen
  void onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
