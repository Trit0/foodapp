// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'main.router.dart';

class _$MainRouter extends RootStackRouter {
  _$MainRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PantryPageRoute.name: (routeData) {
      final args = routeData.argsAs<PantryPageRouteArgs>(
          orElse: () => const PantryPageRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: PantryPage(
          key: args.key,
          title: args.title,
        ),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 200,
        reverseDurationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddItemPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AddItemPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 200,
        reverseDurationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: AppPage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 200,
        reverseDurationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: HomePage(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 200,
        reverseDurationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          PantryPageRoute.name,
          path: '/',
          meta: <String, dynamic>{'title': 'Foodapp'},
          children: [
            RouteConfig(
              '*#redirect',
              path: '*',
              parent: PantryPageRoute.name,
              redirectTo: '',
              fullMatch: true,
            )
          ],
        ),
        RouteConfig(
          AddItemPageRoute.name,
          path: '/add-item',
          children: [
            RouteConfig(
              '*#redirect',
              path: '*',
              parent: AddItemPageRoute.name,
              redirectTo: '',
              fullMatch: true,
            )
          ],
        ),
        RouteConfig(
          AppPageRoute.name,
          path: '/app',
          children: [
            RouteConfig(
              HomePageRoute.name,
              path: '',
              parent: AppPageRoute.name,
            ),
            RouteConfig(
              '*#redirect',
              path: '*',
              parent: AppPageRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [PantryPage]
class PantryPageRoute extends PageRouteInfo<PantryPageRouteArgs> {
  PantryPageRoute({
    Key? key,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          PantryPageRoute.name,
          path: '/',
          args: PantryPageRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'PantryPageRoute';
}

class PantryPageRouteArgs {
  const PantryPageRouteArgs({
    this.key,
    this.title,
  });

  final Key? key;

  final String? title;

  @override
  String toString() {
    return 'PantryPageRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [AddItemPage]
class AddItemPageRoute extends PageRouteInfo<void> {
  const AddItemPageRoute({List<PageRouteInfo>? children})
      : super(
          AddItemPageRoute.name,
          path: '/add-item',
          initialChildren: children,
        );

  static const String name = 'AddItemPageRoute';
}

/// generated route for
/// [AppPage]
class AppPageRoute extends PageRouteInfo<void> {
  const AppPageRoute({List<PageRouteInfo>? children})
      : super(
          AppPageRoute.name,
          path: '/app',
          initialChildren: children,
        );

  static const String name = 'AppPageRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '',
        );

  static const String name = 'HomePageRoute';
}
