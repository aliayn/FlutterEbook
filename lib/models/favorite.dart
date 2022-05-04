import 'package:floor/floor.dart';

@Entity(tableName: 'Favorites')
class Favorite {
  @primaryKey
  late String id;
  late String item;
}
