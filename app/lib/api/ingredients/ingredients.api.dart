import 'package:dio/dio.dart';
import 'package:foodapp/api/base_api.dart';

class IngredientApi extends BaseApi {
  IngredientApi(Dio http) : super(http, "ingredient");

  Future<Response<dynamic>> findProductBySku(String skuCode) async {
    return http.get<dynamic>(url(skuCode));
  }
}
