import 'package:foodapp/api/common/types/json.type.dart';
import 'package:foodapp/utils/json.utils.dart';

class DatabaseEntityModel {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  DatabaseEntityModel({required this.id, this.createdAt, this.updatedAt, this.deletedAt});

  DatabaseEntityModel.fromJson(Json json)
      : id = json["id"],
        createdAt = JsonUtils.parseIfNotNull(json["createdAt"], DateTime.parse)?.toLocal(),
        updatedAt = JsonUtils.parseIfNotNull(json["updatedAt"], DateTime.parse)?.toLocal(),
        deletedAt = JsonUtils.parseIfNotNull(json["deletedAt"], DateTime.parse)?.toLocal();

  DatabaseEntityModel.merge(DatabaseEntityModel target, DatabaseEntityModel source)
      : id = source.id,
        createdAt = source.createdAt ?? target.createdAt,
        updatedAt = source.updatedAt ?? target.updatedAt,
        deletedAt = source.deletedAt ?? target.deletedAt;

  Map<String, dynamic> toJson() => {
        "id": id,
        if (createdAt != null) "createdAt": createdAt?.toIso8601String(),
        if (updatedAt != null) "updatedAt": updatedAt?.toIso8601String(),
        if (deletedAt != null) "deletedAt": deletedAt?.toIso8601String(),
      };
}
