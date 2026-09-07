import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Forum, Beranda, Profil }

class CustomBottomBar extends StatefulWidget {
  final Function(BottomBarEnum)? onChanged;

  CustomBottomBar({this.onChanged});

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Icons.forum,
      activeIcon: Icons.forum_outlined,
      title: "Forum",
      type: BottomBarEnum.Forum,
    ),
    BottomMenuModel(
      icon: Icons.home,
      activeIcon: Icons.home_outlined,
      title: "Beranda",
      type: BottomBarEnum.Beranda,
    ),
    BottomMenuModel(
      icon: Icons.person,
      activeIcon: Icons.person_outline,
      title: "Profil",
      type: BottomBarEnum.Profil,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFD8D8D8),
          width: 0.5,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              bottomMenuList[index].icon,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              bottomMenuList[index].activeIcon,
              color: Colors.grey,
            ),
            label: bottomMenuList[index].title,
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          switch (bottomMenuList[index].type) {
            case BottomBarEnum.Forum:
              Navigator.pushNamed(context, AppRoutes.forumScreen);
              break;
            case BottomBarEnum.Beranda:
              Navigator.pushNamed(context, AppRoutes.homePage);
              break;
            case BottomBarEnum.Profil:
              Navigator.pushNamed(context, AppRoutes.profilScreen);
              break;
          }

          widget.onChanged?.call(bottomMenuList[index].type);
        },
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  final IconData icon;
  final IconData activeIcon;
  final String? title;
  final BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
