import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:foodapp/api/base_api.dart';

class PantryApi extends BaseApi {
  PantryApi() : super("pantry");

  Future<Response<dynamic>> getPantryItems() async {
    return http.get(url());
  }
}
