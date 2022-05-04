import 'package:ebook_app/controllers/setting/setting_controller.dart';
import 'package:ebook_app/theme/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

var _controller = Get.find<SettingController>();

Widget settingUI() => Scaffold(
      body: _createBody(),
    );

_createBody() => ListView.separated(
    padding: EdgeInsets.symmetric(horizontal: 4.h),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: ((context, index) => _createItems(index)),
    separatorBuilder: (context, index) => const Divider(),
    itemCount: 5);

_createItems(int position) {
  switch (position) {
    case 0:
      return _buildItem(CupertinoIcons.heart, 'Favorites',
          () => _controller.routeToFavorites());

    case 1:
      return _buildItem(CupertinoIcons.heart, 'Downloads',
          () => _controller.routeToFavorites());

    case 2:
      return _buildThemeItem(CupertinoIcons.heart, 'Dark Mode');

    case 3:
      return _buildItem(CupertinoIcons.heart, 'Language',
          () => _controller.showLocaleDialog());

    case 4:
      return _buildItem(
          CupertinoIcons.heart, 'About', () => _controller.showAboutDialog());
  }
}

_buildItem(icon, title, function) => ListTile(
      leading: Icon(icon),
      title: title,
      onTap: function,
    );

_buildThemeItem(icon, title) => Builder(builder: (context) {
      return SwitchListTile(
        secondary: Icon(icon),
        title: Text(title),
        value: ThemeService().isDarkMode(),
        onChanged: (v) => ThemeService().switchTheme(),
      );
    });
