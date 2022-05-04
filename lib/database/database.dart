import 'dart:async';

import 'package:ebook_app/database/dao.dart';
import 'package:ebook_app/models/favorite.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Favorite])
abstract class FavoritesDatabase extends FloorDatabase {
  FavoriteDAO get favoriteDAO;
}
