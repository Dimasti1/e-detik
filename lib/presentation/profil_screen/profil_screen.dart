import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ProfilScreen extends StatefulWidget {
  ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Map<String, dynamic>? userData;
  bool isLoading = true;
  Map<String, dynamic>? userName;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> onProfileTapped() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
  }

  Future<void> _fetchUserData() async {
    try {
      // Get data from "Data" collection
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot dataSnapshot = await FirebaseFirestore.instance
            .collection('data')
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
        SnackBar(content: Text('Failed to fetch data: $e')),
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
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: appTheme.red300,
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 27.h),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 28.h,
              ),
            ),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          child: Container(
            margin: EdgeInsets.only(top: 56.h),
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 4.h),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    _buildProfileImage(),
                    SizedBox(height: 28.h),
                    _buildBiodataButton(),
                    SizedBox(height: 44.h),
                    _buildCityRow(context, "NIK", userData?['nik'] ?? "-"),
                    _buildDivider(),
                    _buildCityRow(context, "Tanggal Lahir",
                        userData?['dateOfBirth'] ?? "-"),
                    _buildDivider(),
                    _buildVillageRow(
                        context, "Nama", userName?['username'] ?? "-"),
                    _buildDivider(),
                    _buildCityRow(context, "Kabupaten/kota",
                        userData?['kabupaten'] ?? "-"),
                    _buildDivider(),
                    _buildCityRow(
                        context, "Kecamatan", userData?['kecamatan'] ?? "-"),
                    _buildDivider(),
                    _buildVillageRow(context, "Desa", userData?['desa'] ?? "-"),
                    _buildDivider(),
                    _buildCityRow(
                        context, "Puskesmas", userData?['puskesmas'] ?? "-"),
                    _buildDivider(),
                    _buildVillageRow(
                        context, "Pendamping", userData?['companion'] ?? "-"),
                    _buildDivider(),
                    _buildCityRow(context, "Id Pendamping",
                        userData?['companionId'] ?? "-"),
                    SizedBox(height: 22.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCityRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }

  Widget _buildVillageRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Column(
      children: [
        SizedBox(height: 14.h),
        Divider(),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget _buildProfileImage() {
    return SizedBox(
      height: 130.h,
      width: 138.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMaskGroup,
            height: 130.h,
            width: 130.h,
          ),
          GestureDetector(
            onTap: onProfileTapped,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 44.h,
                width: 44.h,
                decoration: BoxDecoration(
                  color: appTheme.blueGray10001,
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBiodataButton() {
    return CustomElevatedButton(
      onPressed: () =>
          Navigator.pushReplacementNamed(context, AppRoutes.lengkapiDataScreen),
      height: 50.h,
      text: "Lengkapi Biodata",
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientPinkToPinkDecoration,
      buttonTextStyle: CustomTextStyles.titleLargePoppinsOnPrimaryContainer,
    );
  }
}
