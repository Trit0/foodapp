import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/features/pantry/pantry.page.dart';
import 'package:foodapp/navigation/router.dart';

class FoodApp extends StatelessWidget {
  final Dio dio;
  FoodApp({required this.dio});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodApp',
      routes: MyRouter.getRoutes(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const PantryPage(title: 'FoodApp'),
    );
  }
}
