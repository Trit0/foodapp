import 'package:dio/dio.dart';
import 'package:foodapp/api/foodapp/ingredients/ingredients.api.dart';
import 'package:foodapp/api/foodapp/pantry/pantry.api.dart';
import 'package:foodapp/repositories/ingredients.repository.dart';

void mainDelegate() async {
  final dio = Dio();

  // Setup APIs
  final ingredientsApi = IngredientApi(dio);
  final pantryApi = PantryApi(dio);

  // Setup Repositories
  final ingredientsRepository = IngredientsRepository(ingredientsApi);

  // Add interceptors

  // Config onboarding
  // Request permissions

  // Run app with multiprovider
}