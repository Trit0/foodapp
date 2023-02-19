import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:foodapp/repositories/grocery-products.repository.dart';

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
      final grocery = await groceryRepository.groceryProductApi.getGroceryProductBySku(skuController.text);
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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Add item"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CupertinoSearchTextField(
                    controller: skuController,
                    placeholder: "Search with sku code",
                    onSubmitted: (text) => submit(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: tryScan,
                        child: const Text('Scan'),
                      ),
                      CupertinoButton(
                        onPressed: submit,
                        child: const Text('Search'),
                      ),
                      Text(content)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
