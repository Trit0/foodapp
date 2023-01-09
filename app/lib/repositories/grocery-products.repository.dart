import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/api/grocery-products/apis/grocery-product.api.dart';

class GroceryProductsRepository {
  static GroceryProductsRepository of(BuildContext context) => RepositoryProvider.of<GroceryProductsRepository>(context);

  final GroceryProductApi groceryProductApi;

  GroceryProductsRepository(this.groceryProductApi);


}