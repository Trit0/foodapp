import 'package:foodapp/api/common/models/database-entity.model.dart';
import 'package:foodapp/api/common/types/json.type.dart';

class GroceryProductsModel extends DatabaseEntityModel {
  final int? ingredientId;
  final int? duplicateOfGroceryProductId;
  final String? name;
  final String? description;
  final String? skuCode;
  final double? averagePrice;
  final int? averageLifeSpanDays;
  final String? imagePath;
  dynamic productMetadata;

  GroceryProductsModel({
    required super.id,
    this.ingredientId,
    this.duplicateOfGroceryProductId,
    this.name,
    this.description,
    this.skuCode,
    this.averagePrice,
    this.averageLifeSpanDays,
    this.imagePath,
    this.productMetadata,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  GroceryProductsModel.fromJson(Json json)
      : name = json["name"],
        ingredientId = json["ingredientId"],
        duplicateOfGroceryProductId = json["duplicateOfGroceryProductId"],
        description = json["description"],
        skuCode = json["skuCode"],
        averagePrice = json["averagePrice"],
        averageLifeSpanDays = json["averageLifeSpanDays"],
        productMetadata = json["productMetadata"],
        imagePath = json["imagePath"],
        super.fromJson(json);

  GroceryProductsModel copyWith({
    int? ingredientId,
    int? duplicateOfGroceryProductId,
    String? name,
    String? description,
    String? skuCode,
    double? averagePrice,
    int? averageLifeSpanDays,
    String? imagePath,
    dynamic productMetadata,
  }) {
    return GroceryProductsModel(
      id: id,
      ingredientId: ingredientId ?? this.ingredientId,
      duplicateOfGroceryProductId: duplicateOfGroceryProductId ?? this.duplicateOfGroceryProductId,
      name: name ?? this.name,
      description: description ?? this.description,
      skuCode: skuCode ?? this.skuCode,
      averagePrice: averagePrice ?? this.averagePrice,
      averageLifeSpanDays: averageLifeSpanDays ?? this.averageLifeSpanDays,
      imagePath: imagePath ?? this.imagePath,
      productMetadata: productMetadata ?? this.productMetadata,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
