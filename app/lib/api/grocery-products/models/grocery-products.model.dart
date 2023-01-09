import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:foodapp/api/common/models/database-entity.model.dart';

class GroceryProductsModel extends DatabaseEntityModel with EquatableMixin {
  int? ingredientId;
  int? duplicateOfGroceryProductId;
  String? name;
  String? description;
  String? skuCode;
  double? averagePrice;
  int? averageLifeSpanDays;
  String? imagePath;
  dynamic productMetadata;

  GroceryProductsModel({
    int? id,
    this.ingredientId,
    this.duplicateOfGroceryProductId,
    this.name,
    this.description,
    this.skuCode,
    this.averagePrice,
    this.averageLifeSpanDays,
    this.imagePath,
    this.productMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt
}) : super(id, createdAt, updatedAt, deletedAt);

  GroceryProductsModel.fromJson(LinkedHashMap<String, dynamic>? json) : super.fromJson(json) {
    if (json == null) return;

    name = json["name"];

    if (json["ingredientId"] != null) {
      ingredientId = json["ingredientId"];
    }

    if (json["duplicateOfGroceryProductId"] != null) {
      duplicateOfGroceryProductId = json["duplicateOfGroceryProductId"];
    }

    if (json["description"] != null) {
      description = json["description"];
    }

    if (json["skuCode"] != null) {
      skuCode = json["skuCode"];
    }

    if (json["averagePrice"] != null) {
      averagePrice = json["averagePrice"];
    }

    if (json["averageLifeSpanDays"] != null) {
      averageLifeSpanDays = json["averageLifeSpanDays"];
    }

    if (json["productMetadata"] != null) {
      productMetadata = json["productMetadata"];
    }
  }

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

  @override
  List<Object?> get props => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ingredientId,
    duplicateOfGroceryProductId,
    name,
    description,
    skuCode,
    averagePrice,
    averageLifeSpanDays,
    imagePath,
    productMetadata
  ];

}