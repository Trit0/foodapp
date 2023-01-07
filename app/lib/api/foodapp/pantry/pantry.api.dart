import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:foodapp/api/base_api.dart';
import 'package:foodapp/api/foodapp/pantry/models/pantry_item.model.dart';

class PantryApi extends BaseApi {
  PantryApi(Dio http) : super(http, "pantry");

  Future<Response<List<dynamic>>> getPantryItems() async {
    return http.get<List<dynamic>>(url());
  }
}
