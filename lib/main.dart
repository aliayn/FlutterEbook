import 'package:ebook_app/routes/routes.dart';
import 'package:ebook_app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  AppService.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Sizer(
        builder: ((context, orientation, deviceType) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              getPages: AppPages.routes,
              initialRoute: AppPages.initial,
            )),
      );
}
