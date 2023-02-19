import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/api/pantry/models/pantry_item.model.dart';

class PantryItemCard extends StatelessWidget {
  final PantryItemsModel item;
  const PantryItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Card(
          child: Stack(
            children: [
              Center(
                child: Image.network(item.groceryProduct?.imagePath ?? ""),
              ),
              Positioned(
                right: 10,
                top: 5,
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: ClipOval(
                    child: ColoredBox(
                      color: const Color.fromRGBO(238, 238, 240, 1),
                      child: Center(
                        child: Text(
                          item.itemCount.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                item.isLow == true ? Colors.red : CupertinoTheme.of(context).textTheme.textStyle.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 28,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: CupertinoTheme.of(context).primaryContrastingColor.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          item.groceryProduct?.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
