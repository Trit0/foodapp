import 'package:flutter/material.dart';
import 'package:foodapp/api/api.service.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';
import 'package:foodapp/pages/ingredients/ingredient_not_foud/ingredient_not_found.page.dart';
import 'package:foodapp/pages/pantry/widgets/ingredient-card/pantry_item_card.widget.dart';
import 'package:foodapp/widgets/base_list/base_list.widget.dart';

class IngredientNotFoundPage extends StatefulWidget {
  const IngredientNotFoundPage({super.key});

  @override
  State<IngredientNotFoundPage> createState() => _IngredientNotFoundPageState();
}

class _IngredientNotFoundPageState extends State<IngredientNotFoundPage> {
  _retry() {
    Navigator.pop(context);
  }

  _addItem() {
    Navigator.pushNamed(context, "/ingredient/addItem");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add item"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: _addItem, child: const Text("Add the item")),
          ElevatedButton(onPressed: _retry, child: const Text("Retry")),
        ]));
  }
}
