import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';

class KelasBumilScreen extends StatefulWidget {
  KelasBumilScreen({Key? key}) : super(key: key);

  @override
  State<KelasBumilScreen> createState() => _KelasBumilScreenState();
}

class _KelasBumilScreenState extends State<KelasBumilScreen> {
  TextEditingController dateInputController = TextEditingController();

  TextEditingController activityInputController = TextEditingController();

  TextEditingController descriptionInputController = TextEditingController();

  DateTime? selectedDate;

  // ignore: unused_field
  bool _isLoading = false;

  Future<void> _saveDataToFirestore() async {
    setState(() {
      _isLoading = true; // Mulai loading
    });

    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        throw Exception("Pengguna tidak terautentikasi.");
      }

      String uid = currentUser.uid;

      if (selectedDate == null ||
          activityInputController.text.isEmpty ||
          descriptionInputController.text.isEmpty) {
        throw Exception("Semua field harus diisi.");
      }

      String formattedDate =
          "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}";

      await FirebaseFirestore.instance.collection('kelasBumil').doc(uid).set({
        'tanggal': formattedDate,
        'kegiatan': activityInputController.text,
        'tentang': descriptionInputController.text,
      });

      // Verifikasi bahwa data telah tersimpan di Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('kelasBumil')
          .doc(uid)
          .get();

      if (snapshot.exists && snapshot.data() != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Data berhasil disimpan!")),
        );

        clearForm();
        onTapSaveButton(context); // Pindah ke halaman berikutnya jika valid
      } else {
        throw Exception("Gagal memverifikasi data di Firestore.");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal menyimpan data: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false; // Selesai loading
      });
    }
  }

  void clearForm() {
    setState(() {
      selectedDate = null;
    });
    activityInputController.clear();
    descriptionInputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Kelas Bumil"),
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
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Container(
              width: double.maxFinite,
              // height: SizeUtils.height,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment(0.5, 0),
              //     end: Alignment(0.5, 1),
              //     colors: [appTheme.red300, appTheme.pink10002],
              //   ),
              // ),
              // child: Container(
              //   margin: EdgeInsets.only(top: 56.h),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 38.h,
              //     vertical: 90.h,
              //   ),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 24.h,
                  top: 26.h,
                  right: 24.h,
                ),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: fs.Svg(ImageConstant.imgGroup101),
                //     fit: BoxFit.fill,
                //   ),
                // ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Tanggal",
                        style: CustomTextStyles.titleLargeRobotoOnPrimary,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    _buildDateInput(context),
                    SizedBox(height: 36.h),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Kegiatan ke",
                        style: CustomTextStyles.titleLargeRobotoOnPrimary,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    _buildActivityInput(context),
                    SizedBox(height: 36.h),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Tentang",
                        style: CustomTextStyles.titleLargeRobotoOnPrimary,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    _buildDescriptionInput(context),
                    // Spacer(),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildCancelButton(context),
                          _buildSaveButton(context)
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h)
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
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return CustomAppBar(
  //     height: 80.h,
  //     leadingWidth: 24.h,
  //     leading: AppbarLeadingImage(
  //       imagePath: ImageConstant.imgArrowLeftPrimary,
  //       margin: EdgeInsets.only(left: 24.h),
  //       onTap: () {
  //         onTapArrowLeftOne(context);
  //       },
  //     ),
  //     centerTitle: true,
  //     title: AppbarSubtitleFive(
  //       text: "Kelas Bumil yang telah diikuti",
  //       margin: EdgeInsets.only(left: 12.h),
  //     ),
  //     styleType: Style.bgFillRed300_2,
  //   );
  // }

  /// Section Widget
  Widget _buildDateInput(BuildContext context) {
    return CustomTextFormField(
      readOnly: true,
      controller: dateInputController,
      hintText: "dd/mm/yyyy",
      hintStyle: CustomTextStyles.titleSmallRobotoGray5003,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(26.h, 14.h, 16.h, 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCalendar,
          height: 20.h,
          width: 16.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.h,
      ),
      contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        gradient: LinearGradient(
          begin: Alignment(0, 0.5),
          end: Alignment(1, 0.5),
          colors: [appTheme.pink10001, appTheme.pink5001],
        ),
      ),
      borderDecoration: TextFormFieldStyleHelper.gradientPinkToPink,
      filled: false,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now());
        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
            dateInputController.text =
                "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
          });
        }
      },
    );
  }

  /// Section Widget
  Widget _buildActivityInput(BuildContext context) {
    return CustomTextFormField(
      controller: activityInputController,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        gradient: LinearGradient(
          begin: Alignment(0, 0.5),
          end: Alignment(1, 0.5),
          colors: [appTheme.pink10001, appTheme.pink5001],
        ),
      ),
      borderDecoration: TextFormFieldStyleHelper.gradientPinkToPink,
      filled: false,
    );
  }

  /// Section Widget
  Widget _buildDescriptionInput(BuildContext context) {
    return CustomTextFormField(
      controller: descriptionInputController,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.h),
        gradient: LinearGradient(
          begin: Alignment(0, 0.5),
          end: Alignment(1, 0.5),
          colors: [appTheme.pink10001, appTheme.pink5001],
        ),
      ),
      borderDecoration: TextFormFieldStyleHelper.gradientPinkToPink,
      filled: false,
    );
  }

  /// Section Widget
  Widget _buildCancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomElevatedButton(
        height: 35.h,
        width: 65.h,
        text: "Batal",
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientGrayToGrayFDecoration,
        buttonTextStyle: CustomTextStyles.titleMediumInterBlack900,
        onPressed: () {
          clearForm();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomOutlinedButton(
        height: 35.h,
        width: 80.h,
        text: "Simpan",
        buttonTextStyle: TextStyle(fontSize: 16),
        // margin: EdgeInsets.only(left: 12.h, right: 5.h),
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientRedToPinkDecoration,
        onPressed: () {
          _saveDataToFirestore();
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  void onTapArrowLeftOne(BuildContext context) {
    Navigator.pop(context);
  }

  /// Displays a date picker dialog and updates the selected date in the
  // /// current [kelasBumilModelObj] object if the user selects a valid date.
  // Future<void> onTapDateInput(BuildContext context) async {
  //   var initialState = BlocProvider.of<KelasBumilBloc>(context).state;
  //   DateTime? dateTime = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(
  //         DateTime.now().year, DateTime.now().month, DateTime.now().day),
  //   );
  //   if (dateTime != null) {
  //     context.read<KelasBumilBloc>().add(ChangeDateEvent(date: dateTime));
  //     initialState.dateInputController?.text =
  //         dateTime.format(pattern: SHORT_DATE);
  //   }
  // }

  /// Navigates to the hasilInputTwoScreen when the action is triggered.
  onTapSaveButton(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.hasilInputTwoScreen);
  }
}
