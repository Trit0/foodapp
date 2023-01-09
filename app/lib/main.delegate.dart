import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/api/grocery-products/apis/grocery-product.api.dart';
import 'package:foodapp/api/ingredients/ingredients.api.dart';
import 'package:foodapp/api/pantry/pantry.api.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/repositories/grocery-products.repository.dart';
import 'package:foodapp/repositories/ingredients.repository.dart';
import 'package:foodapp/repositories/pantry.repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


void mainDelegate() async {
  final dio = Dio();

  // Setup APIs
  final ingredientsApi = IngredientApi(dio);
  final pantryApi = PantryApi(dio);
  final groceryProductApi = GroceryProductApi(dio);

  // Setup Repositories
  final ingredientsRepository = IngredientsRepository(ingredientsApi);
  final pantryRepository = PantryRepository(pantryApi);
  final groceryProductRepository = GroceryProductsRepository(groceryProductApi);

  // Add interceptors

  // Config onboarding
  // Request permissions

  // Run app with multiprovider

  HydratedBlocOverrides.runZoned(() async => runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(create: (_) => ingredientsRepository),
    RepositoryProvider(create: (_) => pantryRepository),
    RepositoryProvider(create: (_) => groceryProductRepository)
  ], child: FoodApp(dio: dio))));
}