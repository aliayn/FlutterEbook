import 'package:ebook_app/api/api_client.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class ApiService {
  final ApiClient _apiClient = Get.find<ApiClient>();

  Future<CategoryFeed> getPopular() => _apiClient.getPopular();

  Future<CategoryFeed> getRecent() => _apiClient.getRecent();

  Future<CategoryFeed> getAwards() => _apiClient.getAwards();

  Future<CategoryFeed> getNoteworthy() => _apiClient.getNoteworthy();

  Future<CategoryFeed> getShortStory() => _apiClient.getShortStory();

  Future<CategoryFeed> getSciFi() => _apiClient.getSciFi();

  Future<CategoryFeed> getActionAdventure() => _apiClient.getActionAdventure();

  Future<CategoryFeed> getMystery() => _apiClient.getMystery();

  Future<CategoryFeed> getRomance() => _apiClient.getRomance();

  Future<CategoryFeed> getHorror() => _apiClient.getHorror();

  Future<CategoryFeed> getCustomApi(link) => _apiClient.getCustomApi(link);
}
