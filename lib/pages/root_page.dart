import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:bankappclone/pages/dashboard_page.dart';
import 'package:bankappclone/theme/color.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              pageIndex = 4;
            });
          },
          backgroundColor: primary,
          child: const Icon(
            AntIcons.credit_card,
            size: 25,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }

  Widget getTabs() {
    List<IconData> iconItems = [
      CommunityMaterialIcons.home,
      CommunityMaterialIcons.comment,
      CommunityMaterialIcons.bell,
      CommunityMaterialIcons.account_circle,
    ];

    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        activeIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        });
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        DashboardPage(),
        Center(
          child: Text(
            "Chat Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            "Notification Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            "Account Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Text(
            "Credit Card Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
