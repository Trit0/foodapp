import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:foodapp/api/base_api.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';

import 'package:foodapp/api/common/types/json.type.dart';

class PantryApi extends BaseApi {
  PantryApi(Dio http) : super(http, "pantry");

  Future<List<PantryItemsModel>> getPantryItems() async {
    try {
      final Response response = await http.get(url());
      final thing = response.data as List;
      return List.from(thing.map((e) => PantryItemsModel.fromJson(Json.from(e))));
    } catch(e) {
      if (e is DioError && e.response?.statusCode == 400) return [];
      print(e);
      return [];
    }
  }
}
