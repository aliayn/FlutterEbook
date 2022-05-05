import 'package:ebook_app/controllers/genre/genre_controller.dart';
import 'package:get/instance_manager.dart';

class GenreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreController>(() => GenreController());
  }
}
