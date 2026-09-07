import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MasukScreen extends StatefulWidget {
  final void Function()? ontap;
  MasukScreen({Key? key, required this.ontap}) : super(key: key);

  @override
  State<MasukScreen> createState() => _MasukScreenState();
}

class _MasukScreenState extends State<MasukScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  bool isLoadingDialogOpen = false;

  bool isPasswordVisible = false;

  void showLoadingDialog() {
    if (!isLoadingDialogOpen) {
      isLoadingDialogOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
    }
  }

  void closeLoadingDialog() {
    if (isLoadingDialogOpen) {
      Navigator.pop(context);
      isLoadingDialogOpen = false;
    }
  }

  void login() async {
    if (emailInputController.text.trim().isEmpty ||
        passwordInputController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email dan password tidak boleh kosong')),
      );
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
        .hasMatch(emailInputController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Format email tidak valid')),
      );
      return;
    }

    showLoadingDialog();

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailInputController.text.trim(),
        password: passwordInputController.text.trim(),
      );

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.email).get();

        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          String role = userData['role'] ?? '';

          if (mounted) {
            closeLoadingDialog(); // Pastikan dialog ditutup
            navigateBasedOnRole(role);
          }
        } else {
          closeLoadingDialog();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User tidak ditemukan di database')),
          );
        }
      } else {
        closeLoadingDialog();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Email belum terverifikasi. Silakan cek email Anda.')),
        );
        await user?.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      closeLoadingDialog();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal: ${e.message}')),
      );
    } catch (e) {
      closeLoadingDialog();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal: ${e.toString()}')),
      );
    }
  }

  void navigateBasedOnRole(String role) {
    if (roleRoutes.containsKey(role)) {
      Navigator.popAndPushNamed(context, roleRoutes[role]!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Role tidak dikenali')),
      );
    }
  }

  Map<String, String> roleRoutes = {
    'Ibu Hamil': AppRoutes.homePage,
    'Kader Pendamping': AppRoutes.homePageAdmin,
    'Bidan': AppRoutes.homePageAdmin,
    'Petugas Puskesmas': AppRoutes.homePageAdmin,
    'Petugas Kabupaten': AppRoutes.homePageAdmin,
    'Petugas Provinsi': AppRoutes.homePageAdmin,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 42.h,
                  top: 24.h,
                  right: 42.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Masuk",
                        style: CustomTextStyles.displaySmallRed300,
                      ),
                    ),
                    SizedBox(height: 46.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masukkan Email",
                            style: CustomTextStyles.titleLargeRed300_1,
                          ),
                          SizedBox(height: 22.h),
                          CustomTextFormField(
                            controller: emailInputController,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.h,
                              vertical: 16.h,
                            ),
                            borderDecoration: TextFormFieldStyleHelper.fillGray,
                            fillColor: appTheme.gray300.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 38.h),
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "Masukkan Kata Sandi",
                              style: CustomTextStyles.titleLargeRed300_1,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: CustomTextFormField(
                              controller: passwordInputController,
                              textInputAction: TextInputAction.done,
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      26.h, 14.h, 16.h, 14.h),
                                  child: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: appTheme
                                        .gray500, // Sesuaikan warna ikon dengan tema Anda
                                    size: 22.h,
                                  ),
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                maxHeight: 54.h,
                              ),
                              obscureText:
                                  !isPasswordVisible, // Kontrol visibilitas password
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
                              borderDecoration:
                                  TextFormFieldStyleHelper.fillGray,
                              fillColor: appTheme.gray300.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 102.h),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                          context,
                          AppRoutes.lupaKataSandiScreen,
                        );
                      },
                      child: Text(
                        "Lupa kata sandi?",
                        style: CustomTextStyles.titleSmallErrorContainer,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      text: "Masuk",
                      margin: EdgeInsets.only(left: 8.h),
                      buttonStyle: CustomButtonStyles.outlineBlack,
                      onPressed: login,
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Belum punya akun? Register",
                              style: CustomTextStyles
                                  .titleSmallRobotoErrorContainer,
                            ),
                            TextSpan(
                              text: " sekarang",
                              style: CustomTextStyles.titleSmallRobotoRed300,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.masukkanDataScreen,
                                  );
                                },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 52.h),
                    Padding(
                      padding: EdgeInsets.only(right: 70.h),
                      child: Text(
                        "Atau masuk dengan",
                        style: CustomTextStyles.titleSmallRoboto_1,
                      ),
                    ),
                    SizedBox(height: 14.h),
                  ],
                ),
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
      leadingWidth: 56.h,
      leading: Padding(
        padding: EdgeInsets.only(left: 27.0, top: 17.h),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appTheme.red300, size: 24.0),
          onPressed: () {
            back(context);
          },
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  void back(BuildContext context) {
    Navigator.pop(context);
  }
}
