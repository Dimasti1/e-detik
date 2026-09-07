import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edetik/widgets/custom_outlined_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class InputScreeningScreen extends StatefulWidget {
  InputScreeningScreen({super.key});

  @override
  State<InputScreeningScreen> createState() => _InputScreeningScreenState();
}

class _InputScreeningScreenState extends State<InputScreeningScreen> {
  TextEditingController pregnancyAgeInputController = TextEditingController();

  TextEditingController dateInputController1 = TextEditingController();

  TextEditingController dateInputController2 = TextEditingController();

  List<String> dropdownItemList = ["Dokter", "Bidan", "Aplikasi Buaian", "Lainnya"];

  String? selectedIronTabletOption; // "Ya" or "Tidak"

  String? selectedPregnancyCondition; // "Risiko" or "Normal"

  String? selectedDropdownValue;

  DateTime? selectedDate;

  DateTime? selectedDate1;

  // ignore: unused_field
  bool _isLoading = false;

  Future<void> _saveDataToFirestore() async {
    setState(() {
      _isLoading = true; // Mulai loading
    });

    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      String uid = currentUser!.uid;

      String formattedDate = selectedDate != null
          ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
          : '';

      String formattedDate1 = selectedDate1 != null
          ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
          : '';

      await FirebaseFirestore.instance.collection('screening').doc(uid).set({
        'usiaKehamilan': pregnancyAgeInputController.text,
        'periksaTerakhir': formattedDate,
        'KondisiKehamilan': selectedPregnancyCondition,
        'sumberInformasi': selectedDropdownValue.toString(),
        'kelasPertama': formattedDate1,
        'konsumTablet': selectedIronTabletOption,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data berhasil disimpan!")),
      );

      _ontapsimpan(context);
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
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 24.h,
                top: 26.h,
                right: 24.h,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Column(
                      children: [
                        _buildPregnancyAgeSection(context),
                        SizedBox(height: 8.h),
                        _buildLastCheckupSection(context),
                        SizedBox(height: 14.h),
                        _buildPregnancyConditionSection(context),
                        SizedBox(height: 20.h),
                        _buildInformationSourceSection(context),
                        SizedBox(height: 12.h),
                        _buildFirstClassSection(context),
                        SizedBox(height: 18.h),
                        _buildIronTabletSection(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 80.h),
                  _buildActionButtonsSection(context),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return CustomAppBar(
  //     height: 80.h,
  //     leadingWidth: 48.h,
  //     leading: AppbarLeadingImage(
  //       imagePath: ImageConstant.imgArrowLeftPrimary,
  //       margin: EdgeInsets.only(left: 24.h),
  //       onTap: () {
  //         _onTapArrowLeftOne(context);
  //       },
  //     ),
  //     title: AppbarSubtitleOne(
  //       text: "Input Screening",
  //       margin: EdgeInsets.only(left: 12.h),
  //     ),
  //     styleType: Style.bgFillRed300_2,
  //   );
  // }

  Widget _buildPregnancyAgeInput(BuildContext context) {
    return CustomTextFormField(
      controller: pregnancyAgeInputController,
      textInputType: TextInputType.number,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL24,
      fillColor: appTheme.gray500.withOpacity(0.3),
    );
  }

  /// Section Widget
  Widget _buildPregnancyAgeSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Berapa usia kehamilan ibu saat ini? [] minggu",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 8.h),
          _buildPregnancyAgeInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLastCheckupInput(BuildContext context) {
    return CustomTextFormField(
      controller: dateInputController1,
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
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL24,
      fillColor: appTheme.gray500.withOpacity(0.3),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now());
        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
            dateInputController1.text =
                "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
          });
        }
      },
    );
  }

  /// Section Widget
  Widget _buildLastCheckupSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 270.h,
            child: Text(
              "Kapan Ibu terakhir melakukan pemeriksaan kehamilan? [ ]",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 8.h),
          _buildLastCheckupInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPregnancyConditionSection(BuildContext context) {
    // final menuItems = [
    //   ChipviewrisikoItemWidget(onSelectedCallback: ,),
    //   ChipviewNormalItemWidget(onSelectedCallback: ,),
    // ];
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bagaimana kondisi kehamilanfl ibu? [ ]",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  text: "Risiko",
                  buttonStyle: selectedPregnancyCondition == "Risiko"
                      ? CustomButtonStyles.outlineBlack
                      : CustomButtonStyles.outlineBlackTL14,
                  onPressed: () {
                    setState(() {
                      selectedPregnancyCondition = "Risiko";
                    });
                  },
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                  text: "Normal",
                  buttonStyle: selectedPregnancyCondition == "Normal"
                      ? CustomButtonStyles.outlineBlack
                      : CustomButtonStyles.outlineBlackTL14,
                  onPressed: () {
                    setState(() {
                      selectedPregnancyCondition = "Normal";
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      // SizedBox(
      //   width: double.maxFinite,
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: Wrap(
      //         direction: Axis.horizontal,
      //         runSpacing: 12.42.h,
      //         spacing: 12.42.h,
      //         children: menuItems),
      //   ),
      // ),
    );
  }

  /// Section Widget
  Widget _buildInformationSourceSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Darimana Ibu mendapatkan informasi tentang kondisi kehamilannya? [ ]",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 8.h),
          CustomDropDown(
            icon: Container(
              margin: EdgeInsets.only(left: 26.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdropdown,
                height: 20.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            iconSize: 20.h,
            
            items: dropdownItemList,
            contentPadding: EdgeInsets.fromLTRB(20.h, 14.h, 16.h, 14.h),
            borderDecoration: DropDownStyleHelper.fillGray,
            fillColor: appTheme.gray500.withOpacity(0.3),
            onChanged: (value) {
              setState(() {
                selectedDropdownValue = value; // Simpan nilai yang dipilih
              });
            },
            value: selectedDropdownValue, // Tetapkan nilai dropdown
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstClassInput(BuildContext context) {
    return CustomTextFormField(
      controller: dateInputController2,
      textInputAction: TextInputAction.done,
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
      borderDecoration: TextFormFieldStyleHelper.fillGrayTL24,
      fillColor: appTheme.gray500.withOpacity(0.3),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now());
        if (pickedDate != null) {
          setState(() {
            selectedDate1 = pickedDate;
            dateInputController2.text =
                "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
          });
        }
      },
    );
  }

  /// Section Widget
  Widget _buildFirstClassSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            "Kapan Ibu pertama kali mengikuti kelas bumil? [ ]",
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 8.h),
          _buildFirstClassInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  // Widget _buildIronTabletYesButton(BuildContext context) {
  //   return Expanded(
  //     child: CustomElevatedButton(
  //       height: 30.h,
  //       text: "Ya",
  //       margin: EdgeInsets.only(left: 18.h),
  //       buttonStyle: CustomButtonStyles.outlineBlackTL14,
  //       buttonTextStyle: CustomTextStyles.titleSmallBlack900,
  //       onPressed: () {
  //         _onTapIronTabletYesButton(context);
  //       },
  //     ),
  //   );
  // }

  // /// Section Widget
  // Widget _buildIronTabletNoButton(BuildContext context) {
  //   return Expanded(
  //     child: CustomElevatedButton(
  //       height: 30.h,
  //       text: "Tidak",
  //       margin: EdgeInsets.only(left: 14.h),
  //       buttonStyle: CustomButtonStyles.outlineBlackTL141,
  //       buttonTextStyle: CustomTextStyles.titleSmallBlack900,
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildIronTabletSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          SizedBox(
            width: 168.h,
            child: Text(
              "Apakah Ibu mengkonsumsi tablet tambah darah? [ ]",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              height: 30.h,
              text: "Ya",
              margin: EdgeInsets.only(left: 18.h),
              buttonStyle: selectedIronTabletOption == "Ya"
                  ? CustomButtonStyles.outlineBlack
                  : CustomButtonStyles.outlineBlackTL14,
              onPressed: () {
                setState(() {
                  selectedIronTabletOption = "Ya";
                });
              },
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              height: 30.h,
              text: "Tidak",
              margin: EdgeInsets.only(left: 14.h),
              buttonStyle: selectedIronTabletOption == "Tidak"
                  ? CustomButtonStyles.outlineBlack
                  : CustomButtonStyles.outlineBlackTL14,
              onPressed: () {
                setState(() {
                  selectedIronTabletOption = "Tidak";
                });
              },
            ),
          ),
          // _buildIronTabletYesButton(context),
          // _buildIronTabletNoButton(context),
        ],
      ),
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
  Widget _buildActionButtonsSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildCancelButton(context),
          GestureDetector(
            child: Padding(
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
                  _ontapsimpan(context);
                },
              ),
            ),
            // child: Container(
            //   margin: EdgeInsets.only(left: 12.h),
            //   padding: EdgeInsets.symmetric(horizontal: 6.h),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadiusStyle.roundedBorder16,
            //     gradient: LinearGradient(
            //       begin: Alignment(0.5, 0),
            //       end: Alignment(0.5, 1),
            //       colors: [appTheme.red200, appTheme.pink10002],
            //     ),
            //   ),
            //   child: Text(
            //     "Simpan",
            //     textAlign: TextAlign.center,
            //     style: CustomTextStyles.titleMediumInterPrimarySemiBold,
            //   ),
            // ),
            // onTap: () {
            //   _saveDataToFirestore();
            //   _ontapsimpan(context);
            // },
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  void _onTapArrowLeftOne(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the aksiInputScreeningScreen when the action is triggered.
  void _ontapsimpan(BuildContext context) async {
    Navigator.popAndPushNamed(
      context,
      AppRoutes.hasilInputScreen,
    );
  }

  void clearForm() {
    // pregnancyAgeInputController.clear();
    // dateInputController1.clear();
    // dateInputController2.clear();
    // selectedIronTabletOption.
  }
}
