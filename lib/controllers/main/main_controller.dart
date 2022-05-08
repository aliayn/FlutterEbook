
import 'package:ebook_app/base/base_controller.dart';
import 'package:get/get.dart';

class MainController extends BaseController{
  var tabIndex = 0.obs;

   changeTabIndex(int index) => tabIndex(index);
}