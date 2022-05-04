import 'package:ebook_app/controllers/main/main_binding.dart';
import 'package:ebook_app/screens/main/main_page.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static const splash = '/';
  static const main = '/main';
  static const home = '/home';
  static const settings = '/settings';
  static const songs = '/songs';
}

abstract class AppPages {
  static String initial = Routes.main;
  static final routes = <GetPage>[
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
  ];
}
