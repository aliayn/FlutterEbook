import 'package:ebook_app/database/dao.dart';
import 'package:ebook_app/database/database.dart';
import 'package:ebook_app/models/downloads.dart';
import 'package:get/state_manager.dart';

import '../models/favorite.dart';
import '../models/locator.dart';

class DBProvider extends GetxService {
  final String _databaseName = "Ebook.db";
  final Rx<bool> favDBChanged = Rx(false);

  DBProvider() {
    _initDB();
  }

  AppDatabase? _appDatabase;
  late AppDAO _appDAO;

  _initDB() async {
    if (_appDatabase != null) {
      return _appDatabase!;
    }

    _appDatabase =
        await $FloorAppDatabase.databaseBuilder(_databaseName).build();
    _appDAO = _appDatabase!.appDAO;
  }

  close() async {
    await _appDatabase?.close();
  }

//--------------------------------Favorite------------------------------------

  Future insetFavorite(Favorite favorite) {
    favDBChanged(true);
    return _appDAO.insetFavorite(favorite);
  }

  Stream<List<Favorite>> getAllFavorites() => _appDAO.getAllFavorites();

  Future deleteFavorite(String id) {
    favDBChanged(true);
    return _appDAO.deleteFavorite(id);
  }

  Future<Favorite?> findFavorite(String id) => _appDAO.findFavorite(id);

//------------------------------Downloads-------------------------------------

  Future insetDownload(Downloads downloads) => _appDAO.insetDownload(downloads);

  Future<List<Downloads>> getAllDownloads() => _appDAO.getAllDownloads();

  Future deleteDownload(String id) => _appDAO.deleteDownload(id);

  Future<Downloads?> findDownload(String id) => _appDAO.findDownload(id);

//------------------------------Locator-------------------------------------

  Future insetLocator(Locator locator) => _appDAO.insetLocator(locator);

  Future deleteLocator(String id) => _appDAO.deleteLocator(id);

  Future<Locator?> findLocator(String id) => _appDAO.findLocator(id);
}
