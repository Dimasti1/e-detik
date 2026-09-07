import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';

class MonitorRekapScreen extends StatefulWidget {
  MonitorRekapScreen({Key? key}) : super(key: key);

  @override
  State<MonitorRekapScreen> createState() => _MonitorRekapScreenState();
}

class _MonitorRekapScreenState extends State<MonitorRekapScreen> {
  Map<String, dynamic>? dataScreening;
  Map<String, dynamic>? userData;
  Map<String, dynamic>? nameData;
  Map<String, dynamic>? cekMandiri;
  bool isLoading = true;
  String errorMessage = "";

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Fetch data from "screening" collection
        final dataSnapshot1 = await FirebaseFirestore.instance
            .collection('screening')
            .doc(currentUser.uid)
            .get();

        // Fetch data from "cekMandiri" collection
        final mandiriSnapshot = await FirebaseFirestore.instance
            .collection("cekMandiri")
            .doc(currentUser.email)
            .get();

        // Fetch data from "data" and "users" collections
        final userSnapshot = await FirebaseFirestore.instance
            .collection("data")
            .doc(currentUser.uid)
            .get();

        final nameSnapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.email)
            .get();

        setState(() {
          dataScreening = dataSnapshot1.data() ?? {};
          cekMandiri = mandiriSnapshot.data() ?? {};
          userData = userSnapshot.data() ?? {};
          nameData = nameSnapshot.data() ?? {};
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengambil data: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Rekap"),
          leadingWidth: 56.h,
          backgroundColor: appTheme.red300,
          leading: Padding(
            padding: EdgeInsets.only(left: 27.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.0),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 26.h,
                top: 40.h,
                right: 26.h,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "NIK : ", text2: userData?['nik'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Kode Desa : ", text2: "..."),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Nama : ",
                          text2: nameData?['username'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Umur Bumil (Tahun) : ",
                          text2: userData?['dateOfBirth'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Umur Kehamilan (minggu) : ",
                          text2: dataScreening?['usiaKehamilan'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Kondisi Awal : ",
                          text2: dataScreening?['KondisiKehamilan'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Demam : ",
                          text2: cekMandiri?['demam'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Pusing : ",
                          text2: cekMandiri?['pusing'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Cemas : ",
                          text2: cekMandiri?['cemas'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Nyeri Dada : ",
                          text2: cekMandiri?['nyeridada'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Batuk : ",
                          text2: cekMandiri?['batuk'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Gerak Janin : ",
                          text2: cekMandiri?['gerakjanin'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Nyeri Perut : ",
                          text2: cekMandiri?['nyeriperut'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Keluar Cairan : ",
                          text2: cekMandiri?['keluarcairan'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Keputihan : ",
                          text2: cekMandiri?['keputihan'] ?? "-"),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 2.h),
                      child: _buildRow(context,
                          text1: "Diare : ",
                          text2: cekMandiri?['diare'] ?? "-"),
                    ),
                    _buildArrowNavigation(context),
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
      height: 92.h,
      title: AppbarTitle(
        text: "Rekap",
        margin: EdgeInsets.only(left: 28.h),
      ),
      styleType: Style.bgFillRed300,
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

  /// Section Widget
  Widget _buildArrowNavigation(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(12.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14159),
                  child: CustomIconButton(
                    height: 85.h,
                    width: 85.h,
                    padding: EdgeInsets.all(16.h),
                    decoration: IconButtonStyleHelper.none,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                    ),
                  ),
                ),
                CustomIconButton(
                  height: 85.h,
                  width: 85.h,
                  padding: EdgeInsets.all(16.h),
                  decoration: IconButtonStyleHelper.none,
                  onTap: () {
                    onTapRowArrow(context);
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgVector,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the monitorDaftarPendampingScreen when the action is triggered.
  void onTapRowArrow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.monitorDaftarPendampingScreen);
  }
}
