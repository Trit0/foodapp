import 'package:flutter/material.dart';
import 'package:foodapp/features/add_pantry_item/add_item.page.dart';
import 'package:foodapp/features/ingredients/ingredient_not_foud/ingredient_not_found.page.dart';

class MyRouter {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      "/ingredient/notfound": (BuildContext context) =>
          const IngredientNotFoundPage(),
      "/pantry/addItem": (BuildContext context) => const AddItemPage()
      // "/ingredient/addItem":(BuildContext context) =>
    };
  }
}
