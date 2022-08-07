import 'package:dio/dio.dart';
import 'package:foodapp/api/base_api.dart';

class IngredientApi extends BaseApi {
  IngredientApi() : super("ingredient");

  Future<Response<dynamic>> findProductBySku(String skuCode) async {
    return http.get<dynamic>(url(path: skuCode));
  }
}
