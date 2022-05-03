import 'package:ebook_app/controllers/home/home_binding.dart';
import 'package:ebook_app/screens/home/home_page.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static const splash = '/';
  static const main = '/main';
  static const home = '/home';
  static const settings = '/settings';
  static const songs = '/songs';
}

abstract class AppPages {
  static String initial = Routes.home;
  static final routes = <GetPage>[
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
