import 'package:ebook_app/providers/app_provider.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final AppProvider _provider = Get.find<AppProvider>();
  AppProvider get provider => _provider;
}
