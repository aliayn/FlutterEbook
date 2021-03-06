import 'package:ebook_app/base/base_controller.dart';
import 'package:get/get.dart';

import '../../models/category.dart';
import '../../routes/router.dart';
import '../../utils/api_request_status.dart';

class HomeController extends BaseController {
  var apiRequestStatus = APIRequestStatus.loading.obs;
  var top = CategoryFeed().obs;
  var recent = CategoryFeed().obs;

  @override
  void onReady() {
    getFeeds();
    super.onReady();
  }

  getFeeds() async {
    apiRequestStatus(APIRequestStatus.loading);
    try {
      top(await provider.getPopularApi());
      recent(await provider.getRecentApi());
      apiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      checkError(apiRequestStatus, e);
    }
  }

  refreshData() async {
    try {
      top(await provider.getPopularApi());
      recent(await provider.getRecentApi());
    } catch (e) {
      checkError(apiRequestStatus, e);
    }
  }

  routeToGenrePage({required String title, required String url}) =>goToGenrePage(title, url);
}
