import 'package:flutter/material.dart';
import 'package:foodapp/api/api.service.dart';
import 'package:foodapp/api/foodapp/pantry/models/pantry_item.model.dart';
import 'package:foodapp/features/ingredients/ingredient_not_foud/ingredient_not_found.page.dart';
import 'package:foodapp/features/pantry/widgets/ingredient-card/pantry_item_card.widget.dart';
import 'package:foodapp/widgets/base_list/base_list.widget.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController skuController = TextEditingController();
  final ApiService api = ApiService.instance;

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final response =
          await api.ingredient.findProductBySku(skuController.text);
      print(response.statusCode);
      if (response.statusCode == 200 && response.data == "") {
        Navigator.pushNamed(context, "/ingredient/notfound");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add item"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              child: Container(
                  width: 1000,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(labelText: 'SKU'),
                            controller: skuController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return (value?.length ?? 0) > 0
                                  ? null
                                  : "Min length 1";
                            },
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: submit,
                                  child: const Text('Search')),
                            ],
                          )
                        ],
                      ))))
        ]));
  }
}
