import 'package:ebook_app/controllers/setting/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';

settingUI() => Scaffold(
      body: _createBody(),
    );

_createBody() => GetX<SettingController>(
      builder: ((controller) {
        controller.themeMode.value;
        return Builder(
            builder: (context) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 6.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) =>
                    _createItems(controller, index, context)),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5));
      }),
    );

_createItems(controller, position, context) {
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
          CupertinoIcons.info, 'About', () => _showAboutDialog(context));
  }
  return const SizedBox();
}

_buildItem(icon, title, function) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: function,
    );

_buildThemeItem(controller, icon, title) => SwitchListTile(
        secondary: Icon(icon),
        title: Text(title),
        value: controller.themeMode.value,
        onChanged: (v) => controller.switchTheme,
      );

_showAboutDialog(context) async {
  var packageInfo = await PackageInfo.fromPlatform();
  showAboutDialog(
    context: context,
    applicationVersion: packageInfo.version,
    applicationName: packageInfo.appName,
    applicationIcon: Image.asset(
      'assets/images/app-icon.png',
      height: 20.0,
      width: 20.0,
    ),
    children: <Widget>[
      const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text('Awesome eBook app by Ali Aynechian'))
    ],
  );
}
