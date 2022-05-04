import 'package:ebook_app/controllers/explore/explore_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ExploreController>(() => ExploreController());
  }
}
