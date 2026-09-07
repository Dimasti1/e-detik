import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class InputCekMandiriBottomsheet extends StatelessWidget {
  InputCekMandiriBottomsheet({Key? key}) : super(key: key);

  TextEditingController namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 38.h,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 56.h,
                  child: const Divider(),
                ),
              ),
              SizedBox(height: 28.h),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 54.h),
                child: Row(
                  children: [
                    _buildNumberContainer(
                        "1", AppDecoration.gradientPinkToPink),
                    SizedBox(width: 14.h),
                    _buildNumberContainer("2", AppDecoration.fillBlueGray),
                    SizedBox(width: 14.h),
                    _buildNumberContainer("3", AppDecoration.d4),
                    SizedBox(width: 14.h),
                    _buildNumberContainer("4", AppDecoration.d4),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 100.h,
                  child: Divider(indent: 46.h),
                ),
              ),
              SizedBox(
                width: 106.h,
                child: Divider(endIndent: 52.h),
              ),
              SizedBox(
                width: 158.h,
                child: Divider(endIndent: 104.h),
              ),
              SizedBox(height: 42.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "msg_masukkan_nama_anda",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              CustomTextFormField(
                controller: namaController,
                hintText: "lbl_masukkan_nama",
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 26.h,
                  vertical: 14.h,
                ),
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.h),
                  gradient: LinearGradient(
                    begin: Alignment(0, 0.5),
                    end: Alignment(1, 0.5),
                    colors: [
                      appTheme.pink10002,
                      appTheme.pink50,
                    ],
                  ),
                ),
              ),
              SizedBox(height: 340.h),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: CustomIconButton(
                  height: 50.h,
                  width: 50.h,
                  padding: EdgeInsets.all(16.h),
                  decoration: IconButtonStyleHelper.none,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgVector,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberContainer(String label, Decoration decoration) {
    return Container(
      width: 36.h,
      height: 34.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),

      child: Text(
        label,
        textAlign: TextAlign.center,
        style: CustomTextStyles.titleMediumUbuntuPrimary,
      ),
    );
  }
}
