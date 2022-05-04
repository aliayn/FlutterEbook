import 'package:ebook_app/database/dao.dart';
import 'package:ebook_app/database/database.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/favorite.dart';

class DBProvider extends GetxService {
  final String _databaseName = "Ebook.db";

  DBProvider() {
    _initDB();
  }

  FavoritesDatabase? _favoritesDatabase;
  late FavoriteDAO _favoriteDAO;

  _initDB() async {
    if (_favoritesDatabase != null) {
      return _favoritesDatabase!;
    }

    _favoritesDatabase = await $FloorFavoritesDatabase.databaseBuilder(_databaseName).build();
    _favoriteDAO = _favoritesDatabase!.favoriteDAO;
  }

  close() async {
    await _favoritesDatabase?.close();
  }

  Future insetFavorite(Favorite favorite) => _favoriteDAO.insetFavorite(favorite);

  Future<List<Favorite>> getAllFavorites() => _favoriteDAO.getAllFavorites();

  Future deleteFavorite(String id) => _favoriteDAO.deleteFavorite(id);
}
