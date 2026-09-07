import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class HasilInputTwoScreen extends StatefulWidget {
  const HasilInputTwoScreen({Key? key}) : super(key: key);

  @override
  State<HasilInputTwoScreen> createState() => _HasilInputTwoScreenState();
}

class _HasilInputTwoScreenState extends State<HasilInputTwoScreen> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      //ambil data dari koleksi "Data"
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot dataSnapshot = await FirebaseFirestore.instance
            .collection("kelasBumil")
            .doc(currentUser.uid)
            .get();

        setState(() {
          userData = dataSnapshot.data() as Map<String, dynamic>?;
          isLoading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengambil data: $e')),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Hasil Input"),
          leadingWidth: 56.h,
          backgroundColor: appTheme.red300,
          leading: Padding(
            padding: EdgeInsets.only(left: 27.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.0),
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.homePage),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: SizeUtils.height,
          padding: EdgeInsets.only(
            left: 24.h,
            top: 26.h,
            right: 24.h,
          ),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment(0.5, 0),
          //     end: Alignment(0.5, 1),
          //     colors: [appTheme.red300, appTheme.pink10002],
          //   ),
          // ),
          child: Container(
            margin: EdgeInsets.only(top: 2.h),
            // padding: EdgeInsets.only(left: 30.h, top: 84.h),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: fs.Svg(ImageConstant.imgGroup101),
            //     fit: BoxFit.fill,
            //   ),
            // ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Tanggal : ", text2: userData?['tanggal'])),
                  SizedBox(height: 36.h),
                  Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Kegiatann ke : ",
                          text2: userData?['kegiatan'])),
                  SizedBox(height: 36.h),
                  Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Tentang : ", text2: userData?['tentang'])),
                  SizedBox(height: 36.h),
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
      height: 80.h,
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftPrimary,
        margin: EdgeInsets.only(left: 24.h),
        onTap: () {
          _onTapArrowLeftOne(context);
        },
      ),
      title: AppbarSubtitleFive(
        text: "Hasil Input",
        margin: EdgeInsets.only(left: 12.h),
      ),
      styleType: Style.bgFillRed300_2,
    );
  }

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
  void _onTapArrowLeftOne(BuildContext context) {
    Navigator.pop(context);
  }
}
