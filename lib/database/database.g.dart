// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AppDAO? _appDAOInstance;

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
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Downloads` (`id` TEXT NOT NULL, `path` TEXT NOT NULL, `image` TEXT NOT NULL, `size` TEXT NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Locator` (`id` TEXT NOT NULL, `data` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AppDAO get appDAO {
    return _appDAOInstance ??= _$AppDAO(database, changeListener);
  }
}

class _$AppDAO extends AppDAO {
  _$AppDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _favoriteInsertionAdapter = InsertionAdapter(
            database,
            'Favorites',
            (Favorite item) =>
                <String, Object?>{'id': item.id, 'item': item.item},
            changeListener),
        _downloadsInsertionAdapter = InsertionAdapter(
            database,
            'Downloads',
            (Downloads item) => <String, Object?>{
                  'id': item.id,
                  'path': item.path,
                  'image': item.image,
                  'size': item.size,
                  'name': item.name
                }),
        _locatorInsertionAdapter = InsertionAdapter(
            database,
            'Locator',
            (Locator item) =>
                <String, Object?>{'id': item.id, 'data': item.data});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Favorite> _favoriteInsertionAdapter;

  final InsertionAdapter<Downloads> _downloadsInsertionAdapter;

  final InsertionAdapter<Locator> _locatorInsertionAdapter;

  @override
  Stream<List<Favorite>> getAllFavorites() {
    return _queryAdapter.queryListStream('SELECT * FROM Favorites',
        mapper: (Map<String, Object?> row) =>
            Favorite(id: row['id'] as String, item: row['item'] as String),
        queryableName: 'Favorites',
        isView: false);
  }

  @override
  Future<void> deleteFavorite(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Favorites WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<Favorite?> findFavorite(String id) async {
    return _queryAdapter.query('SELECT * FROM Favorites WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Favorite(id: row['id'] as String, item: row['item'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Downloads>> getAllDownloads() async {
    return _queryAdapter.queryList('SELECT * FROM Downloads',
        mapper: (Map<String, Object?> row) => Downloads(
            id: row['id'] as String,
            path: row['path'] as String,
            image: row['image'] as String,
            size: row['size'] as String,
            name: row['name'] as String));
  }

  @override
  Future<void> deleteDownload(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Downloads WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<Downloads?> findDownload(String id) async {
    return _queryAdapter.query('SELECT * FROM Downloads WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Downloads(
            id: row['id'] as String,
            path: row['path'] as String,
            image: row['image'] as String,
            size: row['size'] as String,
            name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteLocator(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Locator WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<Locator?> findLocator(String id) async {
    return _queryAdapter.query('SELECT * FROM Locator WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Locator(id: row['id'] as String, data: row['data'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insetFavorite(Favorite favorite) async {
    await _favoriteInsertionAdapter.insert(
        favorite, OnConflictStrategy.replace);
  }

  @override
  Future<void> insetDownload(Downloads favorite) async {
    await _downloadsInsertionAdapter.insert(
        favorite, OnConflictStrategy.replace);
  }

  @override
  Future<void> insetLocator(Locator locator) async {
    await _locatorInsertionAdapter.insert(locator, OnConflictStrategy.replace);
  }
}
