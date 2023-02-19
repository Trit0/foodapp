import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/api/grocery-products/apis/grocery-product.api.dart';
import 'package:foodapp/api/ingredients/ingredients.api.dart';
import 'package:foodapp/api/pantry/pantry.api.dart';
import 'package:foodapp/app.widget.dart';
import 'package:foodapp/interceptors/lang.interceptor.dart';
import 'package:foodapp/repositories/grocery-products.repository.dart';
import 'package:foodapp/repositories/ingredients.repository.dart';
import 'package:foodapp/repositories/pantry.repository.dart';

void mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _run();
}

Future<void> _run() async {
  final dio = Dio();
  dio.interceptors.add(LangInterceptor());

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

  runZoned(
    () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IngredientsRepository>.value(value: ingredientsRepository),
          RepositoryProvider<PantryRepository>.value(value: pantryRepository),
          RepositoryProvider<GroceryProductsRepository>.value(value: groceryProductRepository),
        ],
        child: FoodApp(dio: dio),
      ),
    ),
  );
}
