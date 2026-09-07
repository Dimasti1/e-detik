import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edetik/theme/custom_button_style.dart';
import 'package:edetik/widgets/custom_elevated_button.dart';
import 'package:edetik/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';

class InputCekMandiriThreeScreen extends StatefulWidget {
  const InputCekMandiriThreeScreen({Key? key}) : super(key: key);

  @override
  State<InputCekMandiriThreeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InputCekMandiriThreeScreen> {
  int selectedIndex = 1;

  TextEditingController namaController = TextEditingController();
  TextEditingController saranController = TextEditingController();

  //page 2
  TextEditingController quest1Controller = TextEditingController();
  TextEditingController quest2Controller = TextEditingController();
  TextEditingController quest3Controller = TextEditingController();
  TextEditingController quest4Controller = TextEditingController();
  TextEditingController quest5Controller = TextEditingController();

  //page3
  TextEditingController quest6Controller = TextEditingController();
  TextEditingController quest7Controller = TextEditingController();
  TextEditingController quest8Controller = TextEditingController();
  TextEditingController quest9Controller = TextEditingController();
  TextEditingController quest10Controller = TextEditingController();

  //index pertanyaan
  List<String?> selectedOptions = List.generate(10, (index) => null);

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: selectedIndex - 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      selectedIndex = index + 1;
    });
  }

  void _onDotTapped(int index) {
    setState(() {
      selectedIndex = index + 1;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void clear() {
    namaController.clear();
    saranController.clear();
    quest1Controller.clear();
    quest2Controller.clear();
    quest3Controller.clear();
    quest4Controller.clear();
    quest5Controller.clear();
    quest6Controller.clear();
    quest7Controller.clear();
    quest8Controller.clear();
    quest9Controller.clear();
    quest10Controller.clear();
    saranController.clear();
  }

  void simpanCekMandiri() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || user.email == null) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User tidak login atau email tidak valid')),
        );
        return;
      }

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .get();

      if (!userDoc.exists) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dokumen user tidak ditemukan di Firestore')),
        );
        return;
      }

      await FirebaseFirestore.instance
          .collection('cekMandiri')
          .doc(user.email)
          .set({
        'nama': namaController.text.trim(),
        'demam': quest1Controller.text.trim(),
        'pusing': quest2Controller.text.trim(),
        'cemas': quest3Controller.text.trim(),
        'nyeridada': quest4Controller.text.trim(),
        'nyeriperut': quest5Controller.text.trim(),
        'batuk': quest6Controller.text.trim(),
        'gerakjanin': quest7Controller.text.trim(),
        'diare': quest8Controller.text.trim(),
        'keputihan': quest9Controller.text.trim(),
        'keluarcairan': quest10Controller.text.trim(),
        'saran': saranController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan')),
      );
      clear();
      _pageHasil();
    } catch (e) {
      Navigator.pop(context);
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Input Cek Mandiri"),
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 4; i++)
                    GestureDetector(
                      onTap: () => _onDotTapped(i - 1),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedIndex == i ? Colors.red : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            i.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  // Lebar total kontainer
                  double totalWidth = constraints.maxWidth;
                  // Lebar satu bagian (untuk 4 tombol)
                  double sectionWidth = totalWidth / 4;

                  return Stack(
                    children: [
                      // Garis abu-abu sepanjang 4 nomor
                      Container(
                        height: 3,
                        color: Colors.grey.shade300,
                      ),
                      // Garis merah sesuai dengan nomor yang dipilih
                      Container(
                        height: 3,
                        width: sectionWidth, // Lebar sesuai satu tombol
                        margin: EdgeInsets.only(
                          left: (selectedIndex - 1) * sectionWidth,
                        ),
                        color: Colors.red,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  _buildPage1(),
                  _buildPage2(),
                  _buildPage3(),
                  _buildPage4(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 4.h,
              ),
              child: Text(
                "Nama",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 26.h),
          CustomTextFormField(
            controller: namaController,
            hintText: "Masukkan Nama",
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 14.h,
            ),
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.h),
              gradient: LinearGradient(
                begin: Alignment(0, 0.5),
                end: Alignment(1, 0.5),
                colors: [
                  appTheme.pink300,
                  appTheme.pink100,
                ],
              ),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.only(top: 350.h, left: 220.h),
          //   child: Padding(
          //     padding: EdgeInsets.all(16.h),
          //     child: CustomIconButton(
          //       height: 85.h,
          //       width: 85.h,
          //       padding: EdgeInsets.all(16.h),
          //       decoration: IconButtonStyleHelper.none,
          //       onTap: () {
          //         setState(() {
          //           selectedIndex == 2;
          //         });
          //       },
          //       child: CustomImageView(
          //         imagePath: ImageConstant.imgVector,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildPage2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          pertanyaan(
              context,
              0,
              "1.",
              "Apakah Ibu merasakan demam Lebih dari dua hari?",
              quest1Controller),
          pertanyaan(
              context,
              1,
              "2.",
              "Apakah Ibu merasakan pusing atau sakit kepala berat?",
              quest2Controller),
          pertanyaan(
              context,
              2,
              "3.",
              "Apakah Ibu merasakan sulit tidur atau cemas berlebih?",
              quest3Controller),
          pertanyaan(
              context,
              3,
              "4.",
              "Apakah Ibu merasakan jantung berdebar-debar atau nyeri di dada?",
              quest4Controller),
          pertanyaan(
              context,
              4,
              "5.",
              "Apakah Ibu batuk lebih dari 2 minggu atau kontak serumah dengan penderita TB?",
              quest5Controller),
        ],
      ),
    );
  }

  Widget _buildPage3() {
    return SingleChildScrollView(
      child: Column(
        children: [
          pertanyaan(
              context,
              5,
              "6.",
              "Apakah Ibu merasakan gerakan janin tidak ada atau <10 kali dalam 12 jam?",
              quest6Controller),
          pertanyaan(context, 6, "7.",
              "Apakah Ibu merasakan nyeri perut hebat?", quest7Controller),
          pertanyaan(
              context,
              7,
              "8.",
              "Apakah Ibu merasakan keluar cairan di dari jalan lahir sangat banyak/berbau?",
              quest8Controller),
          pertanyaan(
              context,
              8,
              "9.",
              "Apakah Ibu merasakan sakit saat kencing/keluar keputihan/gatal di daerah kemaluan?",
              quest9Controller),
          pertanyaan(context, 9, "10.", "Apakah Ibu mengalami diare berulang?",
              quest10Controller),
        ],
      ),
    );
  }

  Widget _buildPage4() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 4.h,
              ),
              child: Text(
                "Saran",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 26.h),
          CustomTextFormField(
            controller: saranController,
            hintText: "Masukkan Saran",
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
                  appTheme.pink300,
                  appTheme.pink100,
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButton(
                  onPressed: () => clear(),
                  height: 22.h,
                  width: 60.h,
                  text: "Batal",
                  buttonStyle: CustomButtonStyles.none,
                  decoration: CustomButtonStyles.gradientGrayToGrayFDecoration,
                  buttonTextStyle: CustomTextStyles.titleMediumInterBlack900,
                ),
                GestureDetector(
                  onTap: () => simpanCekMandiri(),
                  child: Container(
                    margin: EdgeInsets.only(left: 12.h),
                    padding: EdgeInsets.symmetric(horizontal: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                      gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [appTheme.red200, appTheme.pink10002],
                      ),
                    ),
                    child: Text(
                      "Simpan",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.titleMediumInterPrimarySemiBold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget pertanyaan(BuildContext contex, int index, String no, String quest,
      TextEditingController controller) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  no,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMedium15
                      .copyWith(color: appTheme.black900),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    quest,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMedium15
                        .copyWith(color: appTheme.black900),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Ikon Checkmark
              GestureDetector(
                child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmark,
                  height: 40.h,
                  width: 40.h,
                  color: selectedOptions[index] == "ya"
                      ? Colors.green
                      : Colors.red,
                ),
                onTap: () {
                  setState(() {
                    if (selectedOptions[index] == "ya") {
                      selectedOptions[index] = null;
                      controller.text = ""; // Kosongkan controller
                    } else {
                      selectedOptions[index] = "ya";
                      controller.text = "ya";
                    }
                  });
                },
              ),
              SizedBox(width: 12),
              // Ikon ClosePrimary
              GestureDetector(
                child: CustomImageView(
                  imagePath: ImageConstant.imgClosePrimarycontainer,
                  height: 40.h,
                  width: 40.h,
                  color: selectedOptions[index] == "tidak"
                      ? Colors.green
                      : Colors.red,
                ),
                onTap: () {
                  setState(() {
                    if (selectedOptions[index] == "tidak") {
                      selectedOptions[index] = null;
                      controller.text = ""; // Kosongkan controller
                    } else {
                      selectedOptions[index] = "tidak";
                      controller.text = "tidak";
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _pageHasil() {
    Navigator.pushReplacementNamed(context, AppRoutes.hasilInputOneScreen);
  }
}
