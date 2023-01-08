import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:foodapp/api/base_api.dart';
import 'package:foodapp/api/grocery-products/models/grocery-products.model.dart';

class GroceryProductApi extends BaseApi {
  GroceryProductApi(Dio http): super(http, "grocery-product");

  Future<GroceryProductsModel?> getGroceryProductBySku(String skuCode) async {
    try {
      final Response response = await http.get(url(), queryParameters: { "sku": skuCode });
      print(response);
      return GroceryProductsModel.fromJson(LinkedHashMap<String, dynamic>.from(response.data["data"]));
    } catch(e) {
      if (e is DioError && e.response?.statusCode == 400) return null;
      print(e);
      return null;
    }
  }
}