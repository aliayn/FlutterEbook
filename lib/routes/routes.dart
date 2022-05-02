import 'package:get/route_manager.dart';

abstract class Routes {
  static const splash = '/';
  static const main = '/main';
  static const home = '/home';
  static const settings = '/settings';
  static const songs = '/songs';
}

abstract class AppPages {
  static String initial = Routes.splash;
  static final routes = <GetPage>[
    // GetPage(
    //   name: Routes.splash,
    //   page: () => const SplashScreen(),
    //   binding: SplashBinding(),
    // ),
  ];
}
