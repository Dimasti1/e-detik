import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle_two.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AksiInputScreeningScreen extends StatelessWidget {
  AksiInputScreeningScreen({Key? key}) : super(key: key);

  final TextEditingController pregnancyAgeInputController = TextEditingController();
  final TextEditingController lastCheckupInputController = TextEditingController();
  final List<String> dropdownItemList = ["Item One", "Item two", "Item three"];
  final TextEditingController firstClassInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 24.h, top: 26.h, right: 24.h),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Column(
                      children: [
                        _buildPregnancyAgeSection(context),
                        SizedBox(height: 8.h),
                        _buildLastCheckupSection(context),
                        SizedBox(height: 14.h),
                        _buildPregnancyConditionSection(context),
                        SizedBox(height: 20.h),
                        _buildInformationSourceSection(context),
                        SizedBox(height: 12.h),
                        _buildFirstClassSection(context),
                        SizedBox(height: 18.h),
                        _buildIronTabletSection(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 80.h),
                  _buildActionButtonsSection(context),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 80.h,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftPrimary,
        margin: EdgeInsets.only(left: 24.h),
        onTap: () {
          onTapArrowLeftOne(context);
        },
      ),
      title: AppbarSubtitleTwo(
        text: "Input Screening",
        margin: EdgeInsets.only(left: 12.h),
      ),
      styleType: Style.bgFillRed300_2,
    );
  }

  /// Section Widget
  Widget _buildPregnancyAgeInput(BuildContext context) {
    return CustomTextFormField(
      controller: pregnancyAgeInputController,
      hintText: "32",
      contentPadding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL24,
      fillColor: appTheme.gray500.withOpacity(0.3),
    );
  }

  /// Section Widget
  Widget _buildPregnancyAgeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "berapa usia kehamilan ibu saat ini? [ ] minggu",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 10.h),
          _buildPregnancyAgeInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLastCheckupDateInput(BuildContext context) {
    return CustomTextFormField(
      controller: lastCheckupInputController,
      hintText: "10.10.2024",
      suffix: Container(
        margin: EdgeInsets.fromLTRB(26.h, 14.h, 16.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCalendar,
          height: 20.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: 50.h),
      contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL24,
      fillColor: appTheme.gray500.withOpacity(0.3),
      // onTap: () {
      //   onTapLastCheckupDateInput(context);
      // },
    );
  }

  /// Section Widget
  Widget _buildLastCheckupSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 270.h,
            child: Text(
              "Kapan ibu terakhir melakukan pemeriksaan kehamilan? [ ]",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 8.h),
          _buildLastCheckupDateInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHighRiskButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 42.h,
        text: "Risiko tinggi",
        buttonStyle: CustomButtonStyles.outlineBlackTL20,
        buttonTextStyle: CustomTextStyles.titleSmallBlack900Bold,
      ),
    );
  }

  /// Section Widget
  Widget _buildNormalButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 42.h,
        text: "Normal",
        buttonStyle: CustomButtonStyles.outlineBlackTL20,
        buttonTextStyle: CustomTextStyles.titleSmallBlack900Bold,
      ),
    );
  }

  /// Section Widget
  Widget _buildPregnancyConditionSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bagaimana kondisi kehamilan ibu?",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                _buildHighRiskButton(context),
                SizedBox(width: 12.h),
                _buildNormalButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildInformationSourceSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Darimana ibu mendapatkan informasi tentang kondisi kehamilannya? [ ]",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 8.h),
          CustomDropDown(
            icon: Container(
              margin: EdgeInsets.only(left: 26.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdropdown,
                height: 20.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            iconSize: 20.h,
            hintText: "Bidan",
            items: dropdownItemList,
            //error the argumen type 'List<String>' can't be assigned to the parameter type 'List<SelectionPopupmodel>?'
            contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
            borderDecoration: DropDownStyleHelper.fillGray,
            fillColor: appTheme.gray5002.withOpacity(0.3),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstClassDateInput(BuildContext context) {
    return CustomTextFormField(
      readOnly: true,
      controller: firstClassInputController,
      hintText: "10.30.2024",
      textInputAction: TextInputAction.done,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(26.h, 14.h, 16.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCalendar,
          height: 20.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: 50.h),
      contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL24,
      fillColor: appTheme.gray500.withOpacity(0.3),
      // onTap: () {
      //   onTapFirstClassDateInput(context);
      // },
    );
  }

  /// Section Widget
  Widget _buildFirstClassSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            "Kapan Ibu pertama kali mengikuti kelas bumil? [ ]",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 8.h),
          _buildFirstClassDateInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildIronTabletYesButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 30.h,
        text: "Ya",
        margin: EdgeInsets.only(left: 18.h),
        buttonStyle: CustomButtonStyles.outlineBlackTL14,
        buttonTextStyle: CustomTextStyles.titleSmallBlack900,
      ),
    );
  }

  /// Section Widget
  Widget _buildIronTabletNoButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 30.h,
        text: "Tidak",
        margin: EdgeInsets.only(left: 14.h),
        buttonStyle: CustomButtonStyles.outlineBlackTL141,
        buttonTextStyle: CustomTextStyles.titleSmallBlack900,
      ),
    );
  }

  /// Section Widget
  Widget _buildIronTabletSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          SizedBox(
            width: 168.h,
            child: Text(
              "Apakah Ibu mengonsumsi tablet tambah darah? [ ]",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          _buildIronTabletYesButton(context),
          _buildIronTabletNoButton(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildCancelButton(BuildContext context) {
    return CustomElevatedButton(
      height: 30.h,
      width: 60.h,
      text: "Batal",
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientGrayToGrayFDecoration,
      buttonTextStyle: CustomTextStyles.titleMediumInterBlack900,
    );
  }

  /// Section Widget
  Widget _buildActionButtonsSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          onTapActionButtonsSection(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildCancelButton(context),
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
                "Simpan",
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleMediumInterPrimarySemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeftOne(BuildContext context) {
    Navigator.pop(context);
  }

  /// Displays a date picker dialog and updates the selected date in the
  /// current [aksiInputScreeningModelObj] object if the user selects a valid date.
  // Future<void> onTapLastCheckupDateInput(BuildContext context) async {
  //   var initialState = BlocProvider.of<AksiInputScreeningBloc>(context).state;
  //   DateTime? dateTime = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(
  //         DateTime.now().year, DateTime.now().month, DateTime.now().day),
  //   );
  //   if (dateTime != null) {
  //     context
  //         .read<AksiInputScreeningBloc>()
  //         .add(ChangeDateEvent(date: dateTime));
  //     initialState.lastCheckupDateInputController?.text =
  //         dateTime.format(pattern: D_M_Y);
  //   }
  // }

  // /// Displays a date picker dialog and updates the selected date in the
  // /// current [aksiInputScreeningModelObj] object if the user selects a valid date.
  // Future<void> onTapFirstClassDateInput(BuildContext context) async {
  //   var initialState = BlocProvider.of<AksiInputScreeningBloc>(context).state;
  //   DateTime? dateTime = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(
  //         DateTime.now().year, DateTime.now().month, DateTime.now().day),
  //   );
  //   if (dateTime != null) {
  //     context
  //         .read<AksiInputScreeningBloc>()
  //         .add(ChangeDateEvent1(date: dateTime));
  //     initialState.firstClassDateInputController?.text =
  //         dateTime.format(pattern: M_D_Y);
  //   }
  // }

  /// Navigates to the hasilInputScreen when the action is triggered.
  onTapActionButtonsSection(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.hasilInputScreen);
  }
}
