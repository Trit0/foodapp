import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/api/api.service.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';
import 'package:foodapp/pages/add_pantry_item/add_item.page.dart';
import 'package:foodapp/pages/pantry/widgets/ingredient-card/pantry_item_card.widget.dart';
import 'package:foodapp/routing/main.router.dart';
import 'package:foodapp/widgets/base_list/base_list.widget.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key, this.title});
  final String? title;

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  final ApiService apiService = ApiService.instance;
  List<PantryItemsModel>? data = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final response = await apiService.pantry.getPantryItems();
    print(response);
    setState(() {
      data = response;
    });
  }

  void _addItem() async {
    setState(() {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: ((context) => const AddItemPage())));
      AutoRouter.of(context).push(const AddItemPageRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "FoodApp"),
      ),
      body: Center(
          child: BaseList(
              emptyState: const Text("Empty"),
              data: data,
              itemBuilder: (BuildContext context, int index) {
                return PantryItemCard(data![index]);
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
