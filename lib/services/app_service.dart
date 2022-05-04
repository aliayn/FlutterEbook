import 'package:ebook_app/api/api_client.dart';
import 'package:ebook_app/api/api_service.dart';
import 'package:ebook_app/providers/app_provider.dart';
import 'package:get/get.dart';

class AppService {
  static Future init() async {
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<AppProvider>(() => AppProvider());
  }
}
