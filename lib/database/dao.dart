import 'package:ebook_app/models/favorite.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavoriteDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insetFavorite(Favorite favorite);

  @Query('SELECT * FROM Favorites')
  Future<List<Favorite>> getAllFavorites();

  @Query('DELETE FROM Favorites WHERE id=:id')
  Future<void> deleteFavorite(String id);
}
