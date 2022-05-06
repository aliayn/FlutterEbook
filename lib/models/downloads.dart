import 'package:floor/floor.dart';

@Entity(tableName: 'Downloads')
class Downloads {
  @primaryKey
  late String id;
  late String path;
  late String image;
  late String size;
  late String name;

  Downloads(
      {this.id = '',
      this.path = '',
      this.image = '',
      this.size = '',
      this.name = ''});
}
