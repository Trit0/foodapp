import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/app/home/home.page.dart';
import 'package:foodapp/pages/pantry/pantry.page.dart';
import 'package:foodapp/routing/main.router.dart';

class FoodApp extends StatelessWidget {
  final _router = MainRouter();
  final Dio? dio;

  FoodApp({this.dio});

  @override
  Widget build(BuildContext context) {
    // TODO: Setup NiceAuth
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoTheme.of(context).copyWith(primaryColor: Colors.lightGreen),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill), label: "Pantry"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.square_list_fill), label: "Groceries"),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (context) {
              if (index == 0) {
                return const PantryPage();
              }
              return HomePage();
            },
          );
        },
      ),
    );

    //   return CupertinoApp.router(
    //     routerDelegate: _router.delegate(),
    //     routeInformationParser: _router.defaultRouteParser(),
    //     routeInformationProvider: _router.routeInfoProvider(),
    //     debugShowCheckedModeBanner: false,
    //     title: "Base",
    //     // supportedLocales: NiceLocalizations.supportedLocales,
    //     // localizationsDelegates: NiceLocalizations.delegates,
    //     // localeResolutionCallback: NiceLocalizations.localResolutionCallback,
    //   );
  }
}
