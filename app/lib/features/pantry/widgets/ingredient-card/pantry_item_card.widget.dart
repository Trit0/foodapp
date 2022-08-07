import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/api/foodapp/pantry/models/pantry_item.model.dart';

class PantryItemCard extends StatelessWidget {
  final PantryItem item;
  const PantryItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Column(
        children: [Text(item.itemCount.toString())],
      ),
    );
  }
}
