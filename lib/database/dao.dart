import 'package:ebook_app/models/downloads.dart';
import 'package:ebook_app/models/favorite.dart';
import 'package:ebook_app/models/locator.dart';
import 'package:floor/floor.dart';

@dao
abstract class AppDAO {
  //-----------------Favorite---------------------

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insetFavorite(Favorite favorite);

  @Query('SELECT * FROM Favorites')
  Stream<List<Favorite>> getAllFavorites();

  @Query('DELETE FROM Favorites WHERE id = :id')
  Future<void> deleteFavorite(String id);

  @Query('SELECT * FROM Favorites WHERE id = :id')
  Future<Favorite?> findFavorite(String id);

  //------------------Downloads--------------------

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insetDownload(Downloads favorite);

  @Query('SELECT * FROM Downloads')
  Future<List<Downloads>> getAllDownloads();

  @Query('DELETE FROM Downloads WHERE id = :id')
  Future<void> deleteDownload(String id);

  @Query('SELECT * FROM Downloads WHERE id = :id')
  Future<Downloads?> findDownload(String id);

  //------------------Locator--------------------

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insetLocator(Locator locator);

  @Query('DELETE FROM Locator WHERE id = :id')
  Future<void> deleteLocator(String id);

  @Query('SELECT * FROM Locator WHERE id = :id')
  Future<Locator?> findLocator(String id);
}
