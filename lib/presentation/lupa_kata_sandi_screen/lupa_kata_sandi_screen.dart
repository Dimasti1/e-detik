import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LupaKataSandiScreen extends StatelessWidget {
  LupaKataSandiScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.red300,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(
                  "Lupa Kata Sandi",
                  style: theme.textTheme.displaySmall,
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(
                  "Pesan",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(
                  "Masukkan Email dan link ganti password akan dikirim lewat email",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 54.h),
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Masukkan Email",
                      style: CustomTextStyles.titleLargeBold,
                    ),
                    SizedBox(height: 18.h),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Email",
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.h,
                        vertical: 16.h,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 43),
              CustomElevatedButton(
                text: "Kirim",
                margin: EdgeInsets.symmetric(horizontal: 2.h),
                buttonStyle: CustomButtonStyles.outlineBlackTL26,
                buttonTextStyle: CustomTextStyles.titleLargeRed300,
                onPressed: () {
                  _resetPassword(context);
                },
              ),
              Spacer(flex: 56),
            ],
          ),
        ),
      ),
    );
  }

  /// Logika untuk mengirim email reset kata sandi
  /// Logika untuk mengirim email reset kata sandi

 void _resetPassword(BuildContext context) async {
  final email = emailController.text.trim();

  if (email.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Harap masukkan email yang valid.")),
    );
    return;
  }

  try {
    final usersCollection = FirebaseFirestore.instance.collection('users');

    // Query untuk memeriksa email
    final querySnapshot = await usersCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Jika email terdaftar, tautan reset telah dikirim.")),
      );
    } else {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email reset kata sandi telah dikirim ke $email.")),
      );
      Navigator.pop(context);
    }
  } on FirebaseAuthException catch (e) {
    final errorMessage = e.code == 'invalid-email'
        ? "Format email tidak valid."
        : "Terjadi kesalahan: ${e.message}";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Terjadi kesalahan. Silakan coba lagi.")),
    );
  }
}


  /// AppBar Builder
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 51.h,
      leading: Padding(
        padding: EdgeInsets.only(left: 27.0, top: 17.h),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.white, size: 24.0), // Ikon dengan warna putih
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  /// Navigasi kembali
  void onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }

  void masukScreen(BuildContext content) {
    Navigator.pushReplacementNamed(content, AppRoutes.masukScreen);
  }
}
