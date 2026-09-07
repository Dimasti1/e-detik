import 'package:edetik/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widgets/listkehamilan_item_widget.dart';
import 'widgets/listscreening_item_widget.dart';
import 'widgets/listscekmandiri_item_widget.dart';
import 'widgets/listsmonitor_item_widget.dart';
import 'widgets/listspustaka_item_widget.dart';
import 'widgets/listskelasbumil_item_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ignore_for_file: must_be_immutable

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //current logged in user
  final User? currenttUser = FirebaseAuth.instance.currentUser;

  //future for fetsch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currenttUser!.email)
        .get();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldLogout = await _showLogoutConfirmationDialog(context);
        return shouldLogout; // Return true to exit, false to stay
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Home"),
            backgroundColor: appTheme.red300,
          ),
          drawer: MyDrawer(),
          body: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: buildCustomHeader(context),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 44.h, right: 40.h),
                      // child: Column(
                      //   children: [
                      //     CustomSearchView(
                      //       controller: searchController,
                      //       hintText: "Pencarian",
                      //       contentPadding:
                      //           EdgeInsets.fromLTRB(16.h, 14.h, 12.h, 14.h),
                      //     ),
                      //   ],
                      // ),
                    ),
                    SizedBox(height: 20.h),
                    _buildMenuSection(context),
                    SizedBox(height: 16.h),
                    _buildRecommendedArticles(context),
                    SizedBox(height: 16.h),
                    _buildHorizontalScroll(context),
                    SizedBox(height: 16.h),
                    _buildHorizontalScroll1(context),
                  ],
                ),
              ),
            ),
          ),
          // bottomNavigationBar: CustomBottomBar(),
        ),
      ),
    );
  }

  Widget buildCustomHeader(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(fontSize: 16.h, color: Colors.red),
            ),
          );
        } else if (snapshot.hasData) {
          Map<String, dynamic>? user = snapshot.data!.data();
          String username =
              user != null ? user['username'] ?? 'Pengguna' : 'Pengguna';

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
            child: Text(
              "Halo, $username",
              style: TextStyle(
                fontSize: 20.h,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: const Text('No data available'),
          );
        }
      },
    );
  }

  // AppBar Builder with FutureBuilder
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return PreferredSize(
  //     preferredSize: Size.fromHeight(112.h),
  //     child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
  //       future: getUserDetails(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return AppBar(
  //             title: const Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //           );
  //         } else if (snapshot.hasError) {
  //           return AppBar(
  //             title: Text('Error: ${snapshot.error}'),
  //           );
  //         } else if (snapshot.hasData) {
  //           Map<String, dynamic>? user = snapshot.data!.data();
  //           return CustomAppBar(
  //             height: 112.h,
  //             title: Padding(
  //               padding: EdgeInsets.only(left: 36.h),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   AppbarSubtitleSix(
  //                     text: "Halo,",
  //                     margin: EdgeInsets.only(right: 80.h),
  //                   ),
  //                   AppbarSubtitleFour(
  //                     text: user != null
  //                         ? user['username'] ?? 'Pengguna'
  //                         : 'Pengguna',
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             actions: [
  //               AppbarTrailingImage(
  //                 imagePath: ImageConstant.imgPlay,
  //                 height: 54.h,
  //                 width: 54.h,
  //                 margin: EdgeInsets.only(right: 31.h),
  //                 onTap: () {
  //                   // onTapPlayone(context);
  //                 },
  //               ),
  //             ],
  //             styleType: Style.bgFillRed300,
  //           );
  //         } else {
  //           return AppBar(
  //             title: const Text('No data available'),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildMenuSection(BuildContext context) {
    // Daftar dinamis
    final menuItems = [
      ListscreeningItemWidget(
        onTapStackscreening: () {
          onTapImgScreeningOne(context);
        },
        onTapImgScreeningOne: () {
          onTapImgScreeningOne(context);
        },
      ),
      ListCekMandiriItemWidget(
        onTapStackCekMandiri: () {
          onTapStackCekMandiri(context);
        },
        onTapImgCekMandiri: () {
          onTapImgCekMandiri(context);
        },
      ),
      ListMonitoriItemWidget(
        onTapStackMonitor: () {
          onTapStackMonitor(context);
        },
        onTapImgMonitor: () {
          onTapImgMonitor(context);
        },
      ),
      ListPustakaiItemWidget(
        onTapStackPustaka: () {
          onTapStackPustaka(context);
        },
        onTapImgPustaka: () {
          onTapImgPustaka(context);
        },
      ),
      ListKelasBumiliItemWidget(
        onTapStackKelasBumil: () {
          onTapStackKelasBumil(context);
        },
        onTapImgKelasBumil: () {
          onTapImgKelasBumil(context);
        },
      ),
      // ListCekMandiriItemWidget(
      //   onTapStackCekMandiri: onTapStackCekMandiri(context),
      //   onTapImgCekMandiri: onTapImgCekMandiri(context),
      // ),
      // Tambahkan widget lain sesuai kebutuhan
    ];
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 20.h, right: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Menu",
                      style: CustomTextStyles.titleMediumPoppinsBlack900,
                    ),
                    Icon(Icons.arrow_right_alt),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 32.h,
              children: menuItems,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRecommendedArticles(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rekomendasi Artikel",
            style: CustomTextStyles.titleMediumPoppinsBlack900,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScroll(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 20.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 12.h,
                children: List.generate(
                  5,
                  (index) {
                    return ListkehamilanItemWidget();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScroll1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 20.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: SizedBox(
            width: 652.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgKehamilanResikoTinggiLarge,
                        height: 130.h,
                        width: double.maxFinite,
                        radius: BorderRadius.circular(10.h),
                      ),
                      SizedBox(height: 14.h),
                      SizedBox(
                        width: 188.h,
                        child: Text(
                          "Kehamilan Risiko Tinggi dan Faktor Penyebabnya",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumPoppins15.copyWith(
                            height: 1.10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.h, top: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.img04c464ac7b9c4,
                          height: 130.h,
                          width: double.maxFinite,
                          radius: BorderRadius.circular(10.h),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Cara Tepat Jalani Kehamilan Berisiko Tinggi",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumPoppins15.copyWith(
                            height: 1.10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.h, top: 4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgWanitaHamilArtikel,
                            height: 130.h,
                            width: double.maxFinite,
                            radius: BorderRadius.circular(10.h),
                            margin: EdgeInsets.only(right: 14.h),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "Memahami Risiko Tinggi pada kehamilan: Langkah-langkah untuk Menjaga Kesehatan Ibu dan Bayi",
                            style: CustomTextStyles.bodyMediumPoppins15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Setelah logout, arahkan pengguna ke halaman login atau splash
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.masukScreen, (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal logout: $e')),
      );
    }
  }

  // Dialog untuk konfirmasi logout
  Future<bool> _showLogoutConfirmationDialog(BuildContext context) async {
    // Tampilkan dialog konfirmasi
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi Logout'),
        content: Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Tidak',
              style: TextStyle(color: Colors.red), // Warna tombol "Tidak"
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigator.of(context).pop(true);
              _logout(); // Panggil fungsi logout di sini
            },
            child: Text(
              'Ya',
              style: TextStyle(color: Colors.green), // Warna tombol "Ya"
            ),
          ),
        ],
      ),
    );
    // Kembalikan nilai default jika user tidak memilih
    return shouldLogout ?? false;
  }

  /// Navigates to the profilScreen when the action is triggered.
  onTapPlayone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profilScreen);
  }

  /// Navigates to the inputScreeningScreen when the action is triggered.
  onTapStackscreening(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.inputScreeningScreen);
  }

  /// Navigates to the kelas BumilScreen when the action is triggered.
  onTapImgScreeningOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.inputScreeningScreen);
  }

  /// Navigates to the inputScreeningScreen when the action is triggered.
  onTapStackCekMandiri(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.inputCekMandiriThreeScreen);
  }

  /// Navigates to the kelas BumilScreen when the action is triggered.
  onTapImgCekMandiri(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.inputCekMandiriThreeScreen);
  }

  /// Navigates to the inputScreeningScreen when the action is triggered.
  onTapStackMonitor(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.monitorRiwayatScreen);
  }

  /// Navigates to the kelas BumilScreen when the action is triggered.
  onTapImgMonitor(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.monitorRiwayatScreen);
  }

  /// Navigates to the inputScreeningScreen when the action is triggered.
  onTapStackPustaka(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pustakaScreen);
  }

  /// Navigates to the kelas BumilScreen when the action is triggered.
  onTapImgPustaka(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pustakaScreen);
  }

  /// Navigates to the inputScreeningScreen when the action is triggered.
  onTapStackKelasBumil(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kelasBumilScreen);
  }

  /// Navigates to the kelas BumilScreen when the action is triggered.
  onTapImgKelasBumil(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kelasBumilScreen);
  }
}
