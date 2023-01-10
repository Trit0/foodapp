import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
    );
  }
}
