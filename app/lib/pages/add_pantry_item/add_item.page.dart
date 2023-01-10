import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:foodapp/api/api.service.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';
import 'package:foodapp/pages/ingredients/ingredient_not_foud/ingredient_not_found.page.dart';
import 'package:foodapp/pages/pantry/widgets/ingredient-card/pantry_item_card.widget.dart';
import 'package:foodapp/repositories/grocery-products.repository.dart';
import 'package:foodapp/widgets/base_list/base_list.widget.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController skuController = TextEditingController();
  late GroceryProductsRepository groceryRepository;
  String content = "";

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final grocery =
          await groceryRepository.groceryProductApi.getGroceryProductBySku(skuController.text);
      if (grocery == null) {
        Navigator.pushNamed(context, "/ingredient/notfound");
      } else {
        if (grocery.name != null) {
          setState(() {
            content = grocery.name!;
          });
        }
      }
    }
  }

  void tryScan() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.DEFAULT);
    print(barcodeScanRes);
    if (barcodeScanRes != "-1") {
      setState(() {
        content = barcodeScanRes;
        skuController.text = barcodeScanRes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    groceryRepository = GroceryProductsRepository.of(context);
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
                                  onPressed: tryScan,
                                  child: const Text('Scan')),
                              ElevatedButton(
                                  onPressed: submit,
                                  child: const Text('Search')),
                              Text(content)
                            ],
                          )
                        ],
                      ))))
        ]));
  }
}
