import 'package:ebook_app/controllers/detail/detail_controller.dart';
import 'package:get/instance_manager.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
