import 'package:ebook_app/base/base_controller.dart';
import 'package:ebook_app/routes/router.dart';
import 'package:ebook_app/theme/theme_service.dart';
import 'package:get/get.dart';

class SettingController extends BaseController {
  var themeMode = ThemeService.instance.isDarkMode().obs;

  switchTheme() {
    ThemeService.instance.switchTheme();
    themeMode(ThemeService.instance.isDarkMode());
  }

  routeToFavorites() => goToFavorite();

  routeToDownloads() => goToDownloads();

  showLocaleDialog() {}

}
