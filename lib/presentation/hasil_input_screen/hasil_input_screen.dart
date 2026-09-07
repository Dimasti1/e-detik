import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';

class HasilInputScreen extends StatefulWidget {
  const HasilInputScreen({Key? key}) : super(key: key);

  @override
  State<HasilInputScreen> createState() => _HasilInputScreenState();
}

class _HasilInputScreenState extends State<HasilInputScreen> {
  Map<String, dynamic>? userData;
  Map<String, dynamic>? userName;
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
            .collection('screening')
            .doc(currentUser.uid)
            .get();

        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.email)
            .get();

        setState(() {
          userData = dataSnapshot.data() as Map<String, dynamic>?;
          userName = userSnapshot.data() as Map<String, dynamic>?;
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
        appBar: AppBar(
          title: Text("Input Screen"),
          backgroundColor: appTheme.red300,
          leadingWidth: 56.h,
          leading: Padding(
            padding: EdgeInsets.only(left: 27.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.0),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          padding: EdgeInsets.only(
            left: 24.h,
            // top: 26.h,
            right: 24.h,
          ),
          child: Container(
            margin: EdgeInsets.only(top: 2.h),
            child: SingleChildScrollView(
              child: Container(
                // margin: EdgeInsets.only(top: 2.h),
                child: SingleChildScrollView(
                  child: Container(
                    // height: 200.h,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(right: 2.h),
                                child: _buildRow(context,
                                    text1: "Nama Bumil : ",
                                    text2: userName?['username']),
                              ),
                              SizedBox(height: 34.h),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(right: 2.h),
                                child: _buildRow(context,
                                    text1: "Usia Kandungan : ",
                                    text2: userData?['usiaKehamilan'] ?? "-"),
                              ),
                              SizedBox(height: 34.h),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(right: 2.h),
                                child: _buildRow(context,
                                    text1: "Tanggal Periksa : ",
                                    text2: userData?['periksaTerakhir'] ?? "-"),
                              ),
                              SizedBox(height: 34.h),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(right: 2.h),
                                child: _buildRow(context,
                                    text1: "Kondisi Kehamilan : ",
                                    text2:
                                        userData?['KondisiKehamilan'] ?? "-"),
                              ),
                              SizedBox(height: 34.h),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(right: 2.h),
                                child: _buildRow(context,
                                    text1: "Sumber : ",
                                    text2: userData?['sumberInformasi'] ?? "-"),
                              ),
                              SizedBox(height: 34.h),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(right: 2.h),
                                child: _buildRow(context,
                                    text1: "Kelas Bumil : ",
                                    text2: userData?['kelasPertama'] ?? "-"),
                              ),
                              SizedBox(height: 34.h),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(right: 2.h),
                                child: _buildRow(context,
                                    text1: "Minum Tablet Tambah Darah : ",
                                    text2: userData?['konsumTablet'] ?? "-"),
                              ),
                              SizedBox(height: 34.h),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 54.h),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: fs.Svg(ImageConstant.imgGroup101),
                //     fit: BoxFit.fill,
                //   ),
                // ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       width: 142.h,
                //       child: Text(
                //         "Nama Bumil: \n\n\nUsia Kandungan: \n\n\nTanggal Periksa: \n\n\nKondisi Kehamilan: \n\n\nSumber: \n\n\nKelas Bumil: \n\n\nMinum Tablet\nTambah Darah: ",
                //         maxLines: 20,
                //         overflow: TextOverflow.ellipsis,
                //         style: CustomTextStyles.titleMediumBlack900,
                //       ),
                //     ),
                //     SizedBox(
                //       width: 120.h,
                //       child: Text(
                //         "Adelia Ratnasari\n\n\n32\n\n\n10/10/2024\n\n\nNormal\n\n\nBidan\n\n\n10/30/2024\n\n\nYa",
                //         maxLines: 19,
                //         overflow: TextOverflow.ellipsis,
                //         textAlign: TextAlign.right,
                //         style: CustomTextStyles.titleMediumBlack900,
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return CustomAppBar(
  //     height: 80.h,
  //     leadingWidth: 48.h,
  //     leading: AppbarLeadingImage(
  //       imagePath: ImageConstant.imgArrowLeftPrimary,
  //       margin: EdgeInsets.only(left: 24.h),
  //       onTap: () {
  //         onTapArrowLeft(context);
  //       },
  //     ),
  //     title: AppbarSubtitleFive(
  //       text: "Hasil Input",
  //       margin: EdgeInsets.only(left: 12.h),
  //     ),
  //     styleType: Style.bgFillRed300_2,
  //   );
  // }

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
  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
