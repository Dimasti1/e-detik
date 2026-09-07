import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';

class InputCekMandiriFourScreen extends StatelessWidget {
  InputCekMandiriFourScreen({Key? key}) : super(key: key);

  final TextEditingController apasaranController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [appTheme.red300, appTheme.pink10002],
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 58.h),
            padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 52.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: fs.Svg(ImageConstant.imgGroup101),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 196.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStepIndicator("1", appTheme.blueGray10002),
                        SizedBox(width: 14.h),
                        _buildStepIndicator("2", appTheme.blueGray10001),
                        SizedBox(width: 14.h),
                        _buildStepIndicator("3", appTheme.blueGray10002),
                        SizedBox(width: 14.h),
                        _buildStepIndicator(
                          "4",
                          appTheme.pink300,
                          gradient: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                _buildDivider(),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "Saran",
                    style: CustomTextStyles.titleLargeRobotoOnPrimary,
                  ),
                ),
                SizedBox(height: 30.h),
                CustomTextFormField(
                  controller: apasaranController,
                  hintText: "Apa saran anda?",
                  hintStyle: CustomTextStyles.titleSmallRobotoGray5003,
                  textInputAction: TextInputAction.done,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.h),
                    gradient: LinearGradient(
                      begin: Alignment(0, 0.5),
                      end: Alignment(1, 0.5),
                      colors: [appTheme.pink10001, appTheme.pink5001],
                    ),
                  ),
                  borderDecoration: TextFormFieldStyleHelper.gradientPinkToPink,
                  filled: false,
                ),
                SizedBox(height: 34.h),
                _buildActionButtons(context),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: CustomIconButton(
                    height: 50.h,
                    width: 50.h,
                    padding: EdgeInsets.all(16.h),
                    decoration: IconButtonStyleHelper.none,
                    onTap: () {
                      onTapBtnPreviousone(context);
                    },
                    child:
                        CustomImageView(imagePath: ImageConstant.imgPrevious),
                  ),
                ),
                SizedBox(height: 44.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator(String label, Color color,
      {bool gradient = false}) {
    return Container(
      width: 36.h,
      height: 34.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadiusStyle.roundedBorder16,
        gradient: gradient
            ? LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [appTheme.pink300, appTheme.pink10002],
              )
            : null,
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: CustomTextStyles.titleMediumUbuntuPrimary,
      ),
    );
  }

  Widget _buildDivider() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 152.h,
        child: Divider(
          color: appTheme.blueGray10002.withOpacity(0.5),
          endIndent: 98.h,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomElevatedButton(
            height: 30.h,
            width: 60.h,
            text: "lbl_batal",
            buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientGrayToGrayFDecoration,
            buttonTextStyle: CustomTextStyles.titleMediumInterBlack900,
          ),
          Container(
            margin: EdgeInsets.only(left: 12.h),
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder16,
              gradient: LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [appTheme.red200, appTheme.pink10002],
              ),
            ),
            child: Text(
              "lbl_simpan",
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumInterPrimarySemiBold,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 24.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftPrimary,
        margin: EdgeInsets.only(left: 24.h),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      title: AppbarSubtitleFive(
        text: "msg_input_cek_mandiri",
        margin: EdgeInsets.only(left: 19.h),
      ),
    );
  }

  void onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  void onTapBtnPreviousone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.inputCekMandiriThreeScreen);
  }
}
