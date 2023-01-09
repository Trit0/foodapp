import 'dart:collection';

class DatabaseEntityModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  DatabaseEntityModel(this.id, this.createdAt, this.updatedAt, this.deletedAt);

  DatabaseEntityModel.fromJson(LinkedHashMap<String, dynamic>? json) {
    if (json == null) return;

    id = json["id"];
    if (json["createdAt"] != null) {
      createdAt = DateTime.tryParse(json["createdAt"])?.toLocal();
    }
    if (json["updatedAt"] != null) {
      updatedAt = DateTime.tryParse(json["updatedAt"])?.toLocal();
    }
    if (json["deletedAt"] != null) {
      deletedAt = DateTime.tryParse(json["deletedAt"])?.toLocal();
    }
  }

  DatabaseEntityModel.merge(DatabaseEntityModel target, DatabaseEntityModel source) {
    id = source.id ?? target.id;
    createdAt = source.createdAt ?? target.createdAt;
    updatedAt = source.updatedAt ?? target.updatedAt;
    deletedAt = source.deletedAt ?? target.deletedAt;
  }

  Map<String, dynamic> toJson() => {
    if (id != null) "id": id,
    if (createdAt != null) "createdAt": createdAt?.toIso8601String(),
    if (updatedAt != null) "updatedAt": updatedAt?.toIso8601String(),
    if (deletedAt != null) "deletedAt": deletedAt?.toIso8601String(),
  };
}