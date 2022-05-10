import 'package:ebook_app/controllers/setting/setting_controller.dart';
import 'package:ebook_app/utils/color_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/link.dart';

import '../../utils/const.dart';

settingUI() => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
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
          () => controller.showLocaleDialog(context));

    case 4:
      return _buildItem(
          CupertinoIcons.info, 'About', () => _showAboutDialog(context));
  }
  return const SizedBox();
}

_buildItem(icon, title, function) => ListTile(
      leading: FaIcon(icon, size: 30),
      title: Text(title),
      onTap: function,
    );

_buildThemeItem(controller, icon, title) => SwitchListTile(
      secondary: Icon(icon, size: 30),
      title: Text(title),
      value: controller.themeMode.value,
      onChanged: (v) => controller.switchTheme(),
    );

_showAboutDialog(context) async {
  var packageInfo = await PackageInfo.fromPlatform();
  showAboutDialog(
    context: context,
    applicationVersion: packageInfo.version,
    applicationName: packageInfo.appName,
    children: <Widget>[
      const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text('Awesome eBook app by Ali Aynechian')),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Link(
              uri: Uri.parse(facebookAddress),
              builder: (context, followLink) => GFIconButton(
                onPressed: followLink,
                type: GFButtonType.outline,
                color: HexColor.fromHex('#3b5998'),
                icon: const FaIcon(FontAwesomeIcons.facebook),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Link(
              uri: Uri.parse(whatsappAddress),
              builder: ((context, followLink) => GFIconButton(
                    onPressed: followLink,
                    type: GFButtonType.outline,
                    color: HexColor.fromHex('#43d854'),
                    icon: const Icon(FontAwesomeIcons.whatsapp),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Link(
              uri: Uri.parse(twitterAddress),
              builder: ((context, followLink) => GFIconButton(
                    onPressed: followLink,
                    type: GFButtonType.outline,
                    color: HexColor.fromHex('#3f729b'),
                    icon: const Icon(FontAwesomeIcons.twitter),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Link(
              uri: Uri.parse(linkedinAddress),
              builder: (context, followLink) => GFIconButton(
                onPressed: followLink,
                type: GFButtonType.outline,
                color: HexColor.fromHex('#0077b5'),
                icon: const Icon(FontAwesomeIcons.linkedin),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Link(
              uri: Uri.parse(githubAddress),
              builder: (context, followLink) => GFIconButton(
                onPressed: followLink,
                type: GFButtonType.outline,
                color: HexColor.fromHex('#00405d'),
                icon: const Icon(FontAwesomeIcons.github),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
