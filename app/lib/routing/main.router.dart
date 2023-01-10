import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/pages/add_pantry_item/add_item.page.dart';
import 'package:foodapp/pages/app/app.page.dart';
import 'package:foodapp/pages/app/home/home.page.dart';
import 'package:foodapp/pages/auth/auth.page.dart';
import 'package:foodapp/pages/auth/sign-in/sign-in.page.dart';

import 'package:foodapp/pages/pantry/pantry.page.dart';

part 'main.router.gr.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@CustomAutoRouter(
  preferRelativeImports: false,
  durationInMilliseconds: 200,
  reverseDurationInMilliseconds: 200,
  transitionsBuilder: TransitionsBuilders.fadeIn,
  routes: const [
    AutoRoute(
      path: "/",
      initial: true,
      page: PantryPage,
      meta: {
        "title": "Foodapp"
      },
      children: [
        RedirectRoute(
          path: "*",
          redirectTo: "",
        ),
      ],
    ),
    AutoRoute(
      path: "/add-item",
      page: AddItemPage,
      children: [
        RedirectRoute(
          path: "*",
          redirectTo: "",
        ),
      ]
    ),
    AutoRoute(
      path: "/app",
      page: AppPage,
      children: [
        AutoRoute(
          path: "",
          initial: true,
          page: HomePage,
        ),
        RedirectRoute(
          path: "*",
          redirectTo: "",
        ),
      ],
    ),
    RedirectRoute(
      path: "*",
      redirectTo: "",
    ),
  ],
)
class MainRouter extends _$MainRouter {}
