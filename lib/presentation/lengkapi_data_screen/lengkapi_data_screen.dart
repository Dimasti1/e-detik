import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class LengkapiDataScreen extends StatefulWidget {
  LengkapiDataScreen({Key? key}) : super(key: key);

  @override
  State<LengkapiDataScreen> createState() => _LengkapiDataScreenState();
}

class _LengkapiDataScreenState extends State<LengkapiDataScreen> {
  TextEditingController dateInputController = TextEditingController();

  TextEditingController desaInputController = TextEditingController();

  TextEditingController puskesmasInputController = TextEditingController();

  TextEditingController nikInputController = TextEditingController();

  TextEditingController companionIdInputController = TextEditingController();

  TextEditingController companionInputController = TextEditingController();

  List<String> dropdownItemListkab = ["Surabaya", "Sidoarjo", "Madura"];

  List<String> dropdownItemListkec = ["Wonokromo", "Kenduruan", "Jatirogo"];

  List<String> dropdownItemList2 = ["Item one", "Item two", "Item three"];

  String? selectedKabupaten;

  String? selectedKecamatan;

  DateTime? selectedDate;

  Future<void> _saveDataToFirestore() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('Pengguna belum login');
      }

      String uid = currentUser.uid;

      String formattedDate = selectedDate != null
          ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
          : '';

      await FirebaseFirestore.instance.collection('data').doc(uid).set({
        'dateOfBirth': formattedDate,
        'nik': nikInputController.text,
        'kabupaten': selectedKabupaten ?? '',
        'kecamatan': selectedKecamatan ?? '',
        'desa': desaInputController.text,
        'puskesmas': puskesmasInputController.text,
        'companion': companionInputController.text,
        'companionId': companionIdInputController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.red300,
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(42.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Lengkapi Data",
                        style: CustomTextStyles.headlineLargeBold,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  _buildBirthdateInput(context),
                  SizedBox(height: 12.h),
                  _buildNIKInput(context),
                  SizedBox(
                    height: 8.h,
                  ),
                  _buildLocationSelection(context),
                  SizedBox(height: 8.h),
                  _buildDesaInput(context),
                  SizedBox(
                    height: 8,
                  ),
                  _buildPuskesmasInput(context),
                  SizedBox(height: 12.h),
                  _buildCompanionInput(context),
                  SizedBox(height: 12.h),
                  _buildCompanionIdInput(context),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildSaveSection(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 24.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 27.h),
        onTap: () => onTapArrowLeft(context),
      ),
    );
  }

  Widget _buildBirthdateInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal Lahir",
          style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: dateInputController,
          hintText: "Tanggal Lahir",
          suffix: Container(
            margin: EdgeInsets.fromLTRB(26.h, 14.h, 16.h, 14.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgCalendar,
              height: 20.h,
              width: 20.h,
              fit: BoxFit.contain,
            ),
          ),
          suffixConstraints: BoxConstraints(maxHeight: 50.h),
          contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
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
        ),
      ],
    );
  }

  Widget _buildNIKInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "NIK",
          style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: nikInputController,
          hintText: "NIK",
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
        ),
      ],
    );
  }

  Widget _buildLocationSelection(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kabupaten/Kota",
                  style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
                ),
                SizedBox(height: 6.h),
                CustomDropDown(
                  hintText: "Kab/Kota",
                  items: dropdownItemListkab,
                  contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
                  onChanged: (value) {
                    setState(() {
                      selectedKabupaten = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kecamatan",
                  style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
                ),
                SizedBox(height: 6.h),
                CustomDropDown(
                  hintText: "Kecamatan",
                  items: dropdownItemListkec,
                  contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
                  onChanged: (value) {
                    selectedKecamatan = value;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesaInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Desa",
          style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: desaInputController,
          hintText: "Desa",
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
        ),
      ],
    );
  }

  Widget _buildPuskesmasInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Puskesmas",
          style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: puskesmasInputController,
          hintText: "Puskesmas",
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
        ),
      ],
    );
  }

  Widget _buildCompanionInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pendamping",
          style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: companionInputController,
          hintText: "Pendamping",
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
        ),
      ],
    );
  }

  Widget _buildCompanionIdInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Id Pendamping",
          style: CustomTextStyles.titleMediumInterPrimaryExtraBold,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: companionIdInputController,
          hintText: "Id Pendamping",
          textInputAction: TextInputAction.done,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Simpan",
      margin: EdgeInsets.only(bottom: 12.h),
      buttonTextStyle: CustomTextStyles.titleLargeRed300Black,
      onPressed: () async {
        if (_validateInputs()) {
          await _saveDataToFirestore();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Harap lengkapi semua data')),
          );
        }
        Navigator.pushReplacementNamed(context, AppRoutes.profilScreen);
      },
    );
  }

  bool _validateInputs() {
    return selectedDate != null &&
        nikInputController.text.isNotEmpty &&
        selectedKabupaten != null &&
        selectedKecamatan != null &&
        desaInputController.text.isNotEmpty &&
        puskesmasInputController.text.isNotEmpty &&
        companionInputController.text.isNotEmpty &&
        companionIdInputController.text.isNotEmpty;
  }

  Widget _buildSaveSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 46.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildSaveButton(context)],
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
