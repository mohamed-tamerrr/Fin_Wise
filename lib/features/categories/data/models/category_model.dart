import 'package:isar/isar.dart';

part 'category_model.g.dart';

@collection
class CategoryModel {
  Id id = Isar.autoIncrement;

  late String name;

  late String iconName;

  late int colorValue;

  @Enumerated(EnumType.name)
  late CategoryType type;
}

enum CategoryType { income, expense }
