import 'package:dio/dio.dart';
import 'package:foodapp/api/ingredients/ingredients.api.dart';
import 'package:foodapp/api/pantry/pantry.api.dart';

class ApiService {
  late final PantryApi pantry;
  late final IngredientApi ingredient;

  ApiService(Dio http) {
    pantry = PantryApi(http);
    ingredient = IngredientApi(http);
  }

  static final ApiService instance = ApiService(Dio());
}
