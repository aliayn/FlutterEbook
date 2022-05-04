import 'package:ebook_app/api/api_service.dart';
import 'package:get/get.dart';

import '../models/category.dart';
import '../models/favorite.dart';
import 'db_provider.dart';

class AppProvider extends GetxService {
  final ApiService _apiService = Get.find<ApiService>();
  final DBProvider _dbProvider = Get.find<DBProvider>();

  Future<CategoryFeed> getPopularApi() => _apiService.getPopular();

  Future<CategoryFeed> getRecentApi() => _apiService.getRecent();

  Future<CategoryFeed> getCustomApi(link) => _apiService.getCustomApi(link);

  Future insetFavorite(Favorite favorite) =>_dbProvider.insetFavorite(favorite);

  Future<List<Favorite>> getAllFavorites() => _dbProvider.getAllFavorites();

  Future<void> deleteFavorite(String id) => _dbProvider.deleteFavorite(id);
}
