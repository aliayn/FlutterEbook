import 'package:ebook_app/routes/routes.dart';
import 'package:get/get.dart';

goToFavorite() {
  Get.toNamed(Routes.favorite);
}

goToDownloads() {}

goToGenrePage(title, url) {
  Get.toNamed(Routes.genre, arguments: [title, url]);
}

geToDetailPage(
    {required entry, required imgTag, required titleTag, required authorTag}) {}
