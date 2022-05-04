// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFavoritesDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FavoritesDatabaseBuilder databaseBuilder(String name) =>
      _$FavoritesDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FavoritesDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FavoritesDatabaseBuilder(null);
}

class _$FavoritesDatabaseBuilder {
  _$FavoritesDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FavoritesDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FavoritesDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FavoritesDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FavoritesDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FavoritesDatabase extends FavoritesDatabase {
  _$FavoritesDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoriteDAO? _favoriteDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Favorites` (`id` TEXT NOT NULL, `item` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteDAO get favoriteDAO {
    return _favoriteDAOInstance ??= _$FavoriteDAO(database, changeListener);
  }
}

class _$FavoriteDAO extends FavoriteDAO {
  _$FavoriteDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _favoriteInsertionAdapter = InsertionAdapter(
            database,
            'Favorites',
            (Favorite item) =>
                <String, Object?>{'id': item.id, 'item': item.item});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Favorite> _favoriteInsertionAdapter;

  @override
  Future<List<Favorite>> getAllFavorites() async {
    return _queryAdapter.queryList('SELECT * FROM Favorites',
        mapper: (Map<String, Object?> row) => Favorite());
  }

  @override
  Future<void> deleteFavorite(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Favorites WHERE id=?1', arguments: [id]);
  }

  @override
  Future<void> insetFavorite(Favorite favorite) async {
    await _favoriteInsertionAdapter.insert(
        favorite, OnConflictStrategy.replace);
  }
}
