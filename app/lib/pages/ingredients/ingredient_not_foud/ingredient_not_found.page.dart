import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _addItem,
            child: const Text("Add the item"),
          ),
          ElevatedButton(
            onPressed: _retry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
