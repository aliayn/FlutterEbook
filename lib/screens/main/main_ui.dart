import 'package:ebook_app/controllers/main/main_controller.dart';
import 'package:ebook_app/screens/explore/explore_page.dart';
import 'package:ebook_app/screens/setting/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../home/home_page.dart';

Widget mainUI() => GetX<MainController>(
    builder: ((controller) => Scaffold(
          bottomNavigationBar: _buildBottomNavigationMenu(controller),
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: _buildScreens(),
          ),
        )));

_buildScreens() => [
      const HomePage(),
      const ExplorePage(),
      const SettingPage(),
    ];

final unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12);

const selectedLabelStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

_buildBottomNavigationMenu(controller) => Builder(
    builder: (context) => SizedBox(
          height: 11.h,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: CupertinoColors.systemGrey,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: _navBarsItems(context),
          ),
        ));

_navBarsItems(context) => <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: ("Home"),
        icon: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: const Icon(
            CupertinoIcons.home,
            size: 20.0,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: ("Explore"),
        icon: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: const Icon(
            CupertinoIcons.compass,
            size: 20.0,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: ("Settings"),
        icon: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: const Icon(
            CupertinoIcons.settings,
            size: 20.0,
          ),
        ),
      ),
    ];
