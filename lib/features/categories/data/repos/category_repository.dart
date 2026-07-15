import 'package:flutter/material.dart';

import '../../../../core/database/isar_service.dart';
import '../../../../core/helpers/icon_mapper.dart';
import '../models/category_model.dart';
import 'package:isar/isar.dart';

class CategoryRepository {
  CategoryRepository(this._isar);

  final Isar _isar;

  /// Add / Update Category
  Future<void> saveCategory(CategoryModel category) async {
    await _isar.writeTxn(() async {
      await _isar.categoryModels.put(category);
    });
  }

  /// Get Categories
  Future<List<CategoryModel>> getCategories() async {
    return await _isar.categoryModels.where().findAll();
  }

  /// Get Category By ID
  Future<CategoryModel?> getCategoryById(int id) async {
    return await _isar.categoryModels.get(id);
  }

  /// Delete Category
  Future<void> deleteCategory(int id) async {
    await _isar.writeTxn(() async {
      await _isar.categoryModels.delete(id);
    });
  }

  /// Call this once at app startup
  Future<void> seedDefaultCategoriesIfNeeded() async {
    final existing = await getCategories();
    if (existing.isNotEmpty) {
      return; // already seeded, don't duplicate
    }

    final defaults = CategoryModel()
      ..name = 'Add Category'
      ..iconName = 'category'
      ..colorValue = 0xFF3B82F6
      ..type = CategoryType.none;

    await _isar.writeTxn(() async {
      await _isar.categoryModels.put(defaults);
    });
  }
}
