// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../domain/entities/composition.dart' as _i6;
import '../../presentation/pages/composition/composition.dart' as _i3;
import '../../presentation/pages/home/home.dart' as _i2;
import '../../presentation/pages/launcher.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LauncherRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.LauncherPage());
    },
    HomeRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    CompositionRoute.name: (routeData) {
      final args = routeData.argsAs<CompositionRouteArgs>();
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i3.CompositionPage(
              key: args.key, composition: args.composition));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LauncherRoute.name, path: '/'),
        _i4.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i4.RouteConfig(CompositionRoute.name, path: '/composition-page')
      ];
}

/// generated route for [_i1.LauncherPage]
class LauncherRoute extends _i4.PageRouteInfo<void> {
  const LauncherRoute() : super(name, path: '/');

  static const String name = 'LauncherRoute';
}

/// generated route for [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.CompositionPage]
class CompositionRoute extends _i4.PageRouteInfo<CompositionRouteArgs> {
  CompositionRoute({_i5.Key? key, required _i6.CompositionEntity composition})
      : super(name,
            path: '/composition-page',
            args: CompositionRouteArgs(key: key, composition: composition));

  static const String name = 'CompositionRoute';
}

class CompositionRouteArgs {
  const CompositionRouteArgs({this.key, required this.composition});

  final _i5.Key? key;

  final _i6.CompositionEntity composition;

  @override
  String toString() {
    return 'CompositionRouteArgs{key: $key, composition: $composition}';
  }
}
