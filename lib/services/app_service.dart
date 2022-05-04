import 'package:ebook_app/api/api_client.dart';
import 'package:ebook_app/api/api_service.dart';
import 'package:ebook_app/providers/app_provider.dart';
import 'package:ebook_app/providers/db_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppService {
  static Future init() async {
    await GetStorage.init();
    Get.lazyPut<DBProvider>(() => DBProvider());
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<AppProvider>(() => AppProvider());
  }
}
