import 'package:ebook_app/controllers/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<HomeController>(() => HomeController());
}
