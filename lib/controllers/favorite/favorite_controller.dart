import 'package:ebook_app/base/base_controller.dart';
import 'package:ebook_app/models/favorite.dart';
import 'package:get/get.dart';

class FavoriteController extends BaseController {
  var favorites = <Favorite>[].obs;

  @override
  void onReady() async {
    favorites.assignAll(await provider.getAllFavorites());
    super.onReady();
  }
}
