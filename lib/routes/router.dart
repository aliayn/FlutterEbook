import 'package:ebook_app/routes/routes.dart';
import 'package:get/get.dart';

class Router {
  static void goToFavorite() {}

  static void goToDownloads() {}

  static void goToGenrePage(title, url) {
    Get.toNamed(Routes.genre, arguments: [
      {title: title, url: url}
    ]);
  }
}
