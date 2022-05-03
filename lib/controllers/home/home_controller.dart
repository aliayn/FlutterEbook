import 'package:ebook_app/base/base_controller.dart';
import 'package:get/get.dart';

import '../../models/category.dart';
import '../../utils/api_request_status.dart';
import '../../utils/functions.dart';

class HomeController extends BaseController {
  var apiRequestStatus = APIRequestStatus.loading.obs;
  var top = CategoryFeed();
  var recent = CategoryFeed();

  @override
  void onReady() {
    getFeeds();
    super.onReady();
  }

  getFeeds() async {
    apiRequestStatus(APIRequestStatus.loading);
    try {
      top = await provider.getPopularApi();
      recent = await provider.getRecentApi();
      apiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      _checkError(e);
    }
  }

  _checkError(e) {
    if (Functions.checkConnectionError(e)) {
      apiRequestStatus(APIRequestStatus.connectionError);
    } else {
      apiRequestStatus(APIRequestStatus.error);
    }
  }

  goToGenrePage({required String title, required String url}) {}
}
