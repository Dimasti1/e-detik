import 'package:edetik/core/app_export.dart';
import 'package:edetik/widgets/app_bar/appbar_trailing_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appTheme.red200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: AppbarTrailingImage(
                  imagePath: ImageConstant.imgPlay,
                  height: 54.h,
                  width: 54.h,
                  margin: EdgeInsets.only(right: 10.h),
                  onTap: () {
                    // onTapPlayone(context);
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: appTheme.gray300,
                  ),
                  title: Text("H O M E"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.homePage);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: appTheme.gray300,
                  ),
                  title: const Text('P R O F I L E'),
                  onTap: () {
                    //this is already home screen so just pop drawer
                    Navigator.pop(context);

                    //navigator to profile page
                    Navigator.pushNamed(context, AppRoutes.profilScreen);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.forum,
                    color: appTheme.gray300,
                  ),
                  title: const Text('F O R U M'),
                  onTap: () {
                    //this is already home screen so just pop drawer
                    Navigator.pop(context);

                    //navigator to profile page
                    Navigator.pushNamed(context, AppRoutes.forumScreen);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: appTheme.gray300,
              ),
              title: const Text('L O G O U T'),
              onTap: () {
                //logout
                _showLogoutConfirmationDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext parentContext) async {
    final bool? shouldLogout = await showDialog<bool>(
      context: parentContext,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Tidak', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Iya', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      Navigator.of(parentContext).pop(); // Tutup drawer
      await _logout(parentContext); // Logout dan navigasi
    }
  }

  Future<void> _logout(BuildContext context) async {
    try {
      // Proses logout
      await FirebaseAuth.instance.signOut();

      // Periksa apakah widget masih mounted sebelum navigasi
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.masukScreen, // Ganti dengan rute halaman login Anda
          (route) => false,
        );
      }
    } catch (e) {
      // Periksa apakah widget masih mounted sebelum menampilkan pesan error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal logout: $e')),
        );
      }
    }
  }
}
