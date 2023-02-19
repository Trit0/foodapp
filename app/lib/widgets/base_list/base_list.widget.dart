import 'package:flutter/cupertino.dart';

class BaseList<T> extends StatelessWidget {
  final StatelessWidget? emptyState;
  final IndexedWidgetBuilder itemBuilder;
  final List<T>? data;

  BaseList({
    super.key,
    this.emptyState,
    required this.itemBuilder,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if ((data == null || data!.isEmpty) && emptyState != null) {
      return emptyState!;
    } else if (data != null && data!.isNotEmpty) {
      return Flexible(
        child: ListView.builder(
          itemCount: data!.length,
          itemBuilder: itemBuilder,
        ),
      );
    } else {
      return Container();
    }
  }
}
