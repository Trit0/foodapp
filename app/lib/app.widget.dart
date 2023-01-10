import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/routing/main.router.dart';
import 'package:foodapp/theme/app.theme.dart';
import 'package:nice_flutter_kit/nice_flutter_kit.dart';

class FoodApp extends StatelessWidget {
  final _router = MainRouter();
  final Dio? dio;

  FoodApp({this.dio});

  @override
  Widget build(BuildContext context) {
    // TODO: Setup NiceAuth

    return MaterialApp.router(
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
      routeInformationProvider: _router.routeInfoProvider(),
      debugShowCheckedModeBanner: false,
      title: "Base",
      // supportedLocales: NiceLocalizations.supportedLocales,
      // localizationsDelegates: NiceLocalizations.delegates,
      // localeResolutionCallback: NiceLocalizations.localResolutionCallback,
      theme: AppTheme.generateTheme(),
    );
  }
}
