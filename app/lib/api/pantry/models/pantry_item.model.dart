import 'package:foodapp/api/common/models/database-entity.model.dart';
import 'package:foodapp/api/common/types/json.type.dart';
import 'package:foodapp/api/grocery-products/models/grocery-products.model.dart';
import 'package:foodapp/utils/json.utils.dart';

class PantryItemsModel extends DatabaseEntityModel {
  int? groceryProductId;
  int? homeId;
  int? itemCount;
  bool? isLow;
  GroceryProductsModel? groceryProduct;

  PantryItemsModel({
    required super.id,
    this.groceryProductId,
    this.homeId,
    this.itemCount,
    this.isLow,
    this.groceryProduct,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  PantryItemsModel.fromJson(Json json)
      : groceryProductId = json["groceryProductId"],
        homeId = json["homeId"],
        itemCount = json["itemCount"],
        isLow = json["isLow"],
        groceryProduct = JsonUtils.parseIfNotNull(json["groceryProduct"], GroceryProductsModel.fromJson),
        super.fromJson(json);

  static List<PantryItemsModel> fromJsonList(JsonArray json) {
    return json.map((pantryItem) => PantryItemsModel.fromJson(pantryItem)).toList();
  }

  PantryItemsModel copyWith({
    int? groceryProductId,
    int? homeId,
    int? itemCount,
    bool? isLow,
    GroceryProductsModel? groceryProduct,
  }) {
    return PantryItemsModel(
      id: id,
      groceryProductId: groceryProductId ?? this.groceryProductId,
      homeId: homeId ?? this.homeId,
      itemCount: itemCount ?? this.itemCount,
      isLow: isLow ?? this.isLow,
      groceryProduct: groceryProduct ?? this.groceryProduct,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
