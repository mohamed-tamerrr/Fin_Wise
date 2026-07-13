import '../../features/categories/data/models/category_model.dart';
import '../../features/transactions/data/models/transaction_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([
      CategoryModelSchema,
      TransactionModelSchema,
    ], directory: dir.path);
  }
}
