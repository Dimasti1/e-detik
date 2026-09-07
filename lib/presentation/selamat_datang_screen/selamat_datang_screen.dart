import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

class SelamatDatangScreen extends StatelessWidget {
  const SelamatDatangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 26.h, top: 58.h, right: 26.h),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 16.h,
                      right: 10.h,
                    ),
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEDetikRemovebgPreview,
                          height: 294.h,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(left: 34.h, right: 32.h),
                        ),
                        SizedBox(height: 34.h),
                        Text(
                          "Selamat Datang",
                          style: CustomTextStyles.displaySmallRed300,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "Selamat Datang di E-Detik, pendamping kesehatan ibu hamil berisiko tinggi.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleMediumInterRed300,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 72.h),
                  CustomElevatedButton(
                    text: "Masuk",
                    margin: EdgeInsets.only(left: 4.h),
                    buttonStyle: CustomButtonStyles.fillRed,
                    onPressed: () {
                      Navigator.pushNamed(context, 
                        AppRoutes.masukScreen,
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomElevatedButton(
                    text: "Register",
                    margin: EdgeInsets.only(left: 4.h),
                    buttonStyle: CustomButtonStyles.fillRed,
                    onPressed: () {
                      Navigator.pushNamed(context,
                        AppRoutes.masukkanDataScreen,
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
