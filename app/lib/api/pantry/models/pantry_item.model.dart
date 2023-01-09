import 'package:foodapp/api/models/base_model.dart';

class PantryItem extends BaseModel<PantryItem> {
  final int ingredientId;
  final int accountId;
  final int itemCount;
  final DateTime oldestEntry;
  final DateTime newestEntry;

  PantryItem(this.ingredientId, this.accountId, this.itemCount,
      this.oldestEntry, this.newestEntry);

  @override
  PantryItem fromJson(data) {
    return PantryItem(data?.ingredientId, data?.accountId, data?.itemCount,
        data?.oldestEntry, data?.newestEntry);
  }
}
