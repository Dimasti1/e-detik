import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
// import '../../widgets//custom_drop_down.dart';
// import '../../theme/custom_button_style.dart';
// import '../../widgets/app_bar/appbar_subtitle_two.dart';
// import '../../widgets/custom_elevated_button.dart';

class DaftarScreen extends StatefulWidget {
  DaftarScreen({Key? key}) : super(key: key);

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  TextEditingController nameInputController = TextEditingController();

  TextEditingController phoneNumberInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

  TextEditingController nikInputController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item two", "Item three"];

  String? selectedDropdownValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.red300,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 42.h,
                top: 16.h,
                right: 42.h,
              ),
              child: Column(
                children: [
                  Text(
                    "Registrasi",
                    style: theme.textTheme.displaySmall,
                  ),
                  SizedBox(height: 42.h),
                  _buildInputSection(
                    context,
                    label: "Masukkan Nama",
                    hintText: "Nama",
                    inputWidget: _buildNameInput(context),
                  ),
                  SizedBox(height: 8.h),
                  _buildInputSection(
                    context,
                    label: "Masukkan No. Hp",
                    hintText: "No. Hp",
                    inputWidget: _buildPhoneNumberInput(context),
                  ),
                  SizedBox(height: 12.h),
                  _buildInputSection(
                    context,
                    label: "Masukkan Password",
                    hintText: "Password",
                    inputWidget: _buildPasswordInput(context),
                  ),
                  SizedBox(height: 12.h),
                  _buildInputSection(
                    context,
                    label: "Masukkan NIK",
                    hintText: "NIK",
                    inputWidget: _buildNikInput(context),
                  ),
                  SizedBox(height: 12.h),
                  _buildInputSection(
                    context,
                    label: "Pilih Opsi",
                    hintText: "Pilih salah satu",
                    inputWidget: _buildDropDown(context),
                  ),
                  SizedBox(height: 146.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 24.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 27.h),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
    );
  }

  /// Section Widget for input fields
  Widget _buildInputSection(
    BuildContext context, {
    required String label,
    required String hintText,
    required Widget inputWidget,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              label,
              style: theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 12.h),
          inputWidget,
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: nameInputController,
      hintText: "Nama",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberInput(BuildContext context) {
    return CustomTextFormField(
      controller: phoneNumberInputController,
      hintText: "No. Hp",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: passwordInputController,
      hintText: "Password",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
    );
  }

  /// Section Widget
  Widget _buildNikInput(BuildContext context) {
    return CustomTextFormField(
      controller: nikInputController,
      hintText: "NIK",
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
    );
  }

  /// Dropdown Widget
  Widget _buildDropDown(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedDropdownValue,
      decoration: InputDecoration(
        hintText: "Pilih salah satu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 16.h,
        ),
      ),
      items: dropdownItemList
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedDropdownValue = value;
        });
      },
    );
  }

  /// Navigates to the previous screen.
  void onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
