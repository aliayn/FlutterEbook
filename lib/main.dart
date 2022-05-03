import 'package:ebook_app/routes/routes.dart';
import 'package:ebook_app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            initialRoute: AppPages.initial,
            theme: themeData(ThemeData(
              fontFamily: GoogleFonts.lato().fontFamily,
            )))),
      );

  // Apply font to our app's theme
  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}
