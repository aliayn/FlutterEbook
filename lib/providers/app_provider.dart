import 'package:ebook_app/api/api_service.dart';
import 'package:ebook_app/models/downloads.dart';
import 'package:get/get.dart';

import '../models/category.dart';
import '../models/favorite.dart';
import '../models/locator.dart';
import 'db_provider.dart';

class AppProvider extends GetxService {
  final ApiService _apiService = Get.find<ApiService>();
  final DBProvider _dbProvider = Get.find<DBProvider>();

//-----------------------------Api-----------------------------------------

  Future<CategoryFeed> getPopularApi() => _apiService.getPopular();

  Future<CategoryFeed> getRecentApi() => _apiService.getRecent();

  Future<CategoryFeed> getCustomApi(link) => _apiService.getCustomApi(link);

//-----------------------------Favorite DB---------------------------------

  Future insetFavorite(Favorite favorite) =>_dbProvider.insetFavorite(favorite);

  Stream<List<Favorite>> getAllFavorites() => _dbProvider.getAllFavorites();

  Future deleteFavorite(String id) => _dbProvider.deleteFavorite(id);

  Future<Favorite?> findFavorite(String id) => _dbProvider.findFavorite(id);

//-----------------------------Downloads DB------------------------------- 

  Future insetDownload(Downloads downloads) =>_dbProvider.insetDownload(downloads);

  Future<List<Downloads>> getAllDownloads() => _dbProvider.getAllDownloads();

  Future deleteDownload(String id) => _dbProvider.deleteDownload(id);

  Future<Downloads?> findDownload(String id) => _dbProvider.findDownload(id);

//------------------------------Locator DB-------------------------------------

  Future insetLocator(Locator locator) =>_dbProvider.insetLocator(locator);

  Future deleteLocator(String id) => _dbProvider.deleteLocator(id);

  Future<Locator?> findLocator(String id) => _dbProvider.findLocator(id);
}
