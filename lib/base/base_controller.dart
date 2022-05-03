import 'package:ebook_app/providers/app_provider.dart';
import 'package:get/get.dart';

import '../utils/api_request_status.dart';
import '../utils/functions.dart';

class BaseController extends GetxController {
  final AppProvider _provider = Get.find<AppProvider>();
  AppProvider get provider => _provider;

  checkError(apiRequestStatus, e) {
    if (Functions.checkConnectionError(e)) {
      apiRequestStatus(APIRequestStatus.connectionError);
    } else {
      apiRequestStatus(APIRequestStatus.error);
    }
  }
}
