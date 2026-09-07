import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../../core/app_export.dart';
import "../../widgets/app_bar/appbar_leading_image.dart";
import "../../widgets/app_bar/appbar_subtitle_five.dart";
import "../../widgets/app_bar/custom_app_bar.dart";

class HasilInputOneScreen extends StatefulWidget {
  const HasilInputOneScreen({Key? key}) : super(key: key);

  @override
  State<HasilInputOneScreen> createState() => _HasilInputOneScreenState();
}

class _HasilInputOneScreenState extends State<HasilInputOneScreen> {
  Map<String, dynamic>? dataMandiri;
  bool isLoading = true; // Untuk menunjukkan status loading
  String errorMessage = ""; // Untuk menyimpan pesan kesalahan

  @override
  void initState() {
    super.initState();
    _fetchdataMandiri();
  }

  Future<void> _fetchdataMandiri() async {
    try {
      // Mendapatkan email pengguna yang sedang login
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null || user.email == null) {
        setState(() {
          errorMessage = "Pengguna belum login atau email tidak ditemukan.";
          isLoading = false;
        });
        return;
      }

      String email = user.email!;

      // Mengambil data dari Firestore berdasarkan email
      DocumentSnapshot<Map<String, dynamic>> dataSnapshot =
          await FirebaseFirestore.instance
              .collection('cekMandiri')
              .doc(email)
              .get();

      if (dataSnapshot.exists) {
        setState(() {
          dataMandiri = dataSnapshot.data();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Data pengguna tidak ditemukan di Firestore.";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Terjadi kesalahan: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hasil Input Cek Mandiri"),
          leadingWidth: 56.h,
          backgroundColor: appTheme.red300,
          leading: Padding(
            padding: EdgeInsets.only(left: 27.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.0),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.homePage),
            ),
          ),
        ),
        body: Container(
          // margin: EdgeInsets.only(top: kToolbarHeight),
          width: double.maxFinite,
          height: SizeUtils.height,
          padding: EdgeInsets.only(left: 14.h, right: 14.h),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment(0.5, 0),
          //     end: Alignment(0.5, 1),
          //     colors: [appTheme.red300, appTheme.pink10002],
          //   ),
          // ),
          child: Container(
            margin: EdgeInsets.only(top: 2.h),
            child: SingleChildScrollView(
              child: Container(
                // height: 746.h,
                padding: EdgeInsets.only(
                  left: 10.h,
                  top: 40.h,
                  // bottom: 60.h,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: fs.Svg(ImageConstant.imgGroup101),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 304.h,
                        margin: EdgeInsets.only(left: 4.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Nama : ",
                                  text2: dataMandiri?['nama'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Demam : ",
                                  text2: dataMandiri?['demam'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Pusing : ",
                                  text2: dataMandiri?['pusing'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Cemas : ",
                                  text2: dataMandiri?['cemas'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Nyeri Dada : ",
                                  text2: dataMandiri?['nyeridada'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Nyeri Perut : ",
                                  text2: dataMandiri?['nyeriperut'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Batuk : ",
                                  text2: dataMandiri?['batuk'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Gerak Janin : ",
                                  text2: dataMandiri?['gerakjanin'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Diare : ",
                                  text2: dataMandiri?['diare'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Keputihan : ",
                                  text2: dataMandiri?['keputihan'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Keluar Cairan : ",
                                  text2: dataMandiri?['keluarcairan'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(right: 2.h),
                              child: _buildRow(context,
                                  text1: "Saran : ",
                                  text2: dataMandiri?['saran'] ?? "-"),
                            ),
                            SizedBox(height: 34.h),
                          ],
                        ),
                      ),
                    ),
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
      title: AppbarSubtitleFive(
        text: "Hasil Input",
        margin: EdgeInsets.only(left: 19.h),
      ),
      styleType: Style.bgFillRed300_2,
    );
  }

  /// Common widget
  Widget _buildRow(
    BuildContext context, {
    required String text1,
    required String text2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          text2,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  void onTapArrowLeftOne(BuildContext context) {
    Navigator.pop(context);
  }
}
