import 'package:ebook_app/controllers/download/download_controller.dart';
import 'package:get/instance_manager.dart';

class DownloadBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<DownloadController>(() => DownloadController());
}
