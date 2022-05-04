import 'package:ebook_app/screens/explore/explore_page.dart';
import 'package:ebook_app/screens/main/custom_nav_bar_item.dart';
import 'package:ebook_app/screens/setting/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../home/home_page.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

Widget mainUI() => StatefulBuilder(
    builder: ((context, setState) => Scaffold(
          bottomNavigationBar: PersistentTabView.custom(context,
              screens: _buildScreens(),
              itemCount: 3,
              controller: _controller,
              confineInSafeArea: true,
              resizeToAvoidBottomInset: true,
              backgroundColor: Theme.of(context).primaryColor,
              customWidget: CustomNavBarWidget(
                  _controller.index, _navBarsItems(context), (index) {
                setState(() {
                  _controller.index =
                      index; // NOTE: THIS IS CRITICAL!! Don't miss it!
                });
              })),
        )));

List<Widget> _buildScreens() => [
    const HomePage(),
    const ExplorePage(),
    const SettingPage(),
  ];

List<PersistentBottomNavBarItem> _navBarsItems(context) => [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: Theme.of(context).colorScheme.secondary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.compass),
      title: ("Explore"),
      activeColorPrimary: Theme.of(context).colorScheme.secondary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.settings),
      title: ("Settings"),
      activeColorPrimary: Theme.of(context).colorScheme.secondary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
