import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';
import 'package:foodapp/api/pantry/pantry.api.dart';

class PantryRepository {
  factory PantryRepository.of(BuildContext context) => RepositoryProvider.of<PantryRepository>(context);

  final PantryApi _pantryApi;

  PantryRepository(this._pantryApi);

  Future<List<PantryItemsModel>> getPantryItems() {
    return _pantryApi.getPantryItems();
  }
}
