import 'package:foodapp/api/foodapp/ingredients/ingredients.api.dart';
import 'package:foodapp/api/foodapp/pantry/pantry.api.dart';

class ApiService {
  late final PantryApi pantry;
  late final IngredientApi ingredient;

  ApiService() {
    pantry = PantryApi();
    ingredient = IngredientApi();
  }

  static final ApiService instance = ApiService();
}
