import 'package:ebook_app/controllers/setting/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

var _controller = Get.find<SettingController>();

settingUI() => Scaffold(
      body: _createBody(),
    );

_createBody() => ListView.separated(
    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 4.h),
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
      return _buildItem(CupertinoIcons.cloud_download, 'Downloads',
          () => _controller.routeToFavorites());

    case 2:
      return _buildThemeItem(CupertinoIcons.moon, 'Dark Mode');

    case 3:
      return _buildItem(CupertinoIcons.location_circle, 'Language',
          () => _controller.showLocaleDialog());

    case 4:
      return _buildItem(
          CupertinoIcons.info, 'About', () => _controller.showAboutDialog());
  }
  return const SizedBox();
}

_buildItem(icon, title, function) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: function,
    );

_buildThemeItem(icon, title) => Builder(
    builder: (context) => Obx(
          () => SwitchListTile(
            secondary: Icon(icon),
            title: Text(title),
            value: _controller.themeMode.value,
            onChanged: (v) => _controller.switchTheme(),
          ),
        ));
