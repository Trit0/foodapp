import 'package:equatable/equatable.dart';
import 'package:foodapp/api/common/models/database-entity.model.dart';
import 'package:foodapp/api/common/types/json.type.dart';


class PantryItemsModel extends DatabaseEntityModel with EquatableMixin {
  int? groceryProductId;
  int? homeId;
  int? itemCount;
  bool? isLow;

  PantryItemsModel({
    int? id,
    this.groceryProductId,
    this.homeId,
    this.itemCount,
    this.isLow,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt
  }) : super(id, createdAt, updatedAt, deletedAt);

  PantryItemsModel.fromJson(Json? json) : super.fromJson(json) {
    if (json == null) return;

    groceryProductId = json["groceryProductId"];

    if (json["homeId"] != null) {
      homeId = json["homeId"];
    }

    if (json["itemCount"] != null) {
      itemCount = json["itemCount"];
    }

    if (json["isLow"] != null) {
      isLow = json["isLow"];
    }
  }

  PantryItemsModel copyWith({
    int? groceryProductId,
    int? homeId,
    int? itemCount,
    bool? isLow,
  }) {
    return PantryItemsModel(
      id: id,
      groceryProductId: groceryProductId ?? this.groceryProductId,
      homeId: homeId ?? this.homeId,
      itemCount: itemCount ?? this.itemCount,
      isLow: isLow ?? this.isLow,
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
    groceryProductId,
    homeId,
    itemCount,
    isLow
  ];


}
