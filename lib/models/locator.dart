import 'package:floor/floor.dart';

@Entity(tableName: 'Locator')
class Locator {
  @primaryKey
  late String id;
  late String data;

  Locator({this.id = '', this.data = ''});
}
