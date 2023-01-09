import 'package:flutter/material.dart';
import 'package:foodapp/api/api.service.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';
import 'package:foodapp/features/add_pantry_item/add_item.page.dart';
import 'package:foodapp/features/pantry/widgets/ingredient-card/pantry_item_card.widget.dart';
import 'package:foodapp/widgets/base_list/base_list.widget.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key, required this.title});
  final String title;

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  final ApiService apiService = ApiService.instance;
  List<dynamic>? data = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final response = await apiService.pantry.getPantryItems();
    setState(() {
      data = response.data;
    });
  }

  void _addItem() async {
    setState(() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => const AddItemPage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: BaseList(
              emptyState: const Text("Empty"),
              data: data,
              itemBuilder: (BuildContext context, int index) {
                return PantryItemCard(
                    PantryItem(2, 3, 4, DateTime.now(), DateTime.now()));
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
