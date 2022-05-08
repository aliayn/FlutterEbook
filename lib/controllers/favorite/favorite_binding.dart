import 'package:ebook_app/controllers/favorite/favorite_controller.dart';
import 'package:get/instance_manager.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true);
  }
}
