import 'package:fin_wise/core/database/isar_service.dart';
import 'package:fin_wise/features/categories/data/models/category_model.dart';
import 'package:isar/isar.dart';

class CategoryRepository {
  /// Add / Update Category
  Future<void> saveCategory(CategoryModel category) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.categoryModels.put(category);
    });
  }

  /// Get Categories
  Future<List<CategoryModel>> getCategories() async {
    return await IsarService.isar.categoryModels
        .where()
        .findAll();
  }

  /// Get Category By ID
  Future<CategoryModel?> getCategoryById(int id) async {
    return await IsarService.isar.categoryModels.get(id);
  }

  /// Delete Category
  Future<void> deleteCategory(int id) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.categoryModels.delete(id);
    });
  }

  /// Call this once at app startup
  Future<void> seedDefaultCategoriesIfNeeded() async {
    final existing = await getCategories();
    if (existing.isNotEmpty) {
      return; // already seeded, don't duplicate
    }

    final defaults = [
      CategoryModel()
        ..name = 'Food'
        ..iconName = 'fork_knife'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.expense,
      CategoryModel()
        ..name = 'Transport'
        ..iconName = 'bus'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.expense,
      CategoryModel()
        ..name = 'Medicine'
        ..iconName = 'pill'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.expense,
      CategoryModel()
        ..name = 'Groceries'
        ..iconName = 'bag'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.expense,
      CategoryModel()
        ..name = 'Rent'
        ..iconName = 'hand_holding'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.expense,
      CategoryModel()
        ..name = 'Gifts'
        ..iconName = 'gift'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.expense,
      CategoryModel()
        ..name = 'Savings'
        ..iconName = 'coins'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.income,
      CategoryModel()
        ..name = 'Entertainment'
        ..iconName = 'ticket'
        ..colorValue = 0xFF3B82F6
        ..type = CategoryType.expense,
    ];

    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.categoryModels.putAll(defaults);
    });
  }
}
