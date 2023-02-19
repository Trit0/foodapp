import 'package:dio/dio.dart';
import 'package:foodapp/api/base_api.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';

class PantryApi extends BaseApi {
  PantryApi(Dio http) : super(http, "pantry");

  Future<List<PantryItemsModel>> getPantryItems() async {
    try {
      final Response response = await http.get(url());
      return PantryItemsModel.fromJsonList(response.data);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return [];
      print(e);
      return [];
    }
  }
}
