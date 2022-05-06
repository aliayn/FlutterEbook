import 'package:ebook_app/controllers/setting/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

settingUI() => Scaffold(
      body: _createBody(),
    );

_createBody() => GetX<SettingController>(
      builder: ((controller) {
        controller.themeMode.value;
        return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 6.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) => _createItems(controller, index)),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 5);
      }),
    );

_createItems(controller, position) {
  switch (position) {
    case 0:
      return _buildItem(CupertinoIcons.heart, 'Favorites',
          () => controller.routeToFavorites());

    case 1:
      return _buildItem(CupertinoIcons.cloud_download, 'Downloads',
          () => controller.routeToDownloads());

    case 2:
      return _buildThemeItem(controller, CupertinoIcons.moon, 'Dark Mode');

    case 3:
      return _buildItem(CupertinoIcons.location_circle, 'Language',
          () => controller.showLocaleDialog());

    case 4:
      return _buildItem(
          CupertinoIcons.info, 'About', () => controller.showAboutDialog());
  }
  return const SizedBox();
}

_buildItem(icon, title, function) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: function,
    );

_buildThemeItem(controller, icon, title) => Builder(
      builder: (context) => SwitchListTile(
        secondary: Icon(icon),
        title: Text(title),
        value: controller.themeMode.value,
        onChanged: (v) => controller.switchTheme(),
      ),
    );
