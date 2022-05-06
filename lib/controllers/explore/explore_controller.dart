import 'package:ebook_app/base/base_controller.dart';
import 'package:ebook_app/models/category.dart';
import 'package:ebook_app/routes/router.dart';

class ExploreController extends BaseController {
  Future<CategoryFeed> getCategory(link) {
    try {
      return provider.getCustomApi(link);
    } catch (e) {
      return Future.error('error: ${e.toString()}');
    }
  }

  routeToGenre(title, url) => goToGenrePage(title, url);
}
