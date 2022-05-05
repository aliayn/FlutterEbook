import 'package:ebook_app/controllers/favorite/favorite_binding.dart';
import 'package:ebook_app/controllers/genre/genre_binding.dart';
import 'package:ebook_app/controllers/main/main_binding.dart';
import 'package:ebook_app/screens/favorite/favorite_page.dart';
import 'package:ebook_app/screens/genre/genre_page.dart';
import 'package:ebook_app/screens/main/main_page.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static const main = '/';
  static const favorite = '/favorite';
  static const genre = '/genre';
}

abstract class AppPages {
  static String initial = Routes.main;
  static final routes = <GetPage>[
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.favorite,
      page: () => const FavoritePage(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: Routes.genre,
      page: () => const GenrePage(),
      binding: GenreBinding(),
    ),
  ];
}
