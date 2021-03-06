import 'package:ebook_app/routes/routes.dart';
import 'package:ebook_app/services/app_service.dart';
import 'package:ebook_app/theme/theme_config.dart';
import 'package:ebook_app/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await AppService.init();
  runApp(const App());
}

class App extends GetView {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Sizer(
        builder: ((context, orientation, deviceType) => GetMaterialApp(
              debugShowCheckedModeBanner: true,
              getPages: AppPages.routes,
              initialRoute: AppPages.initial,
              theme: lightTheme(context),
              darkTheme: darkTheme(context),
              themeMode: ThemeService.instance.theme,
            )));
}
