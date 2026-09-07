import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_search_view.dart';

class MonitorDaftarPendampingScreen extends StatefulWidget {
  MonitorDaftarPendampingScreen({Key? key}) : super(key: key);

  @override
  _MonitorDaftarPendampingScreenState createState() =>
      _MonitorDaftarPendampingScreenState();
}

class _MonitorDaftarPendampingScreenState
    extends State<MonitorDaftarPendampingScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> pendampingList = [];

  @override
  void initState() {
    super.initState();
    fetchPendampingData();
  }

  Future<void> fetchPendampingData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('pendamping').get();
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      setState(() {
        pendampingList = data;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Daftar Pendamping"),
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 36.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchView(
                    controller: searchController,
                    hintText: "Pencarian",
                    contentPadding: EdgeInsets.fromLTRB(16.h, 14.h, 12.h, 14.h),
                  ),
                  SizedBox(height: 24.h),
                  Expanded(child: _buildPendampingList()),
                ],
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 20.h,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159),
                child: CustomIconButton(
                  height: 85.h,
                  width: 85.h,
                  padding: EdgeInsets.all(16.h),
                  decoration: IconButtonStyleHelper.none,
                  onTap: () {
                    onTapBtnPreviousone(context);
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowLeft,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget for AppBar
  PreferredSizeWidget _buildAppbarSection(BuildContext context) {
    return CustomAppBar(
      height: 92.h,
      title: AppbarTitle(
        text: "Daftar Pendamping",
        margin: EdgeInsets.only(left: 28.h),
      ),
      styleType: Style.bgFillRed300,
    );
  }

  /// Build List of Pendamping
  Widget _buildPendampingList() {
    return ListView.builder(
      itemCount: pendampingList.length,
      itemBuilder: (context, index) {
        var pendamping = pendampingList[index];
        return ListTile(
          title: Text("${pendamping['NIK']} - ${pendamping['Nama']}",
              style: theme.textTheme.bodyLarge),
          subtitle: Text(
              "Kabupaten: ${pendamping['Kabupaten']}, Kecamatan: ${pendamping['Kecamatan']}, Desa: ${pendamping['Desa']}, Puskesmas: ${pendamping['Puskesmas']}",
              style: theme.textTheme.bodySmall),
        );
      },
    );
  }

  /// Navigates to the monitorRekapScreen when the action is triggered.
  onTapBtnPreviousone(BuildContext context) {
    Navigator.pop(context);
  }
}
