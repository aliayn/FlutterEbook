import 'package:ebook_app/api/api_service.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class AppProvider extends GetxService {
  final ApiService _apiService = Get.find<ApiService>();

  Future<CategoryFeed> getPopularApi() => _apiService.getPopular();

  Future<CategoryFeed> getRecentApi() => _apiService.getRecent();

  Future<CategoryFeed> getCustomApi(link) => _apiService.getCustomApi(link);
}
