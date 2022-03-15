// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

import '../features/authentication/views/login_page.dart' as _i2;
import '../features/jokes/views/jokes_page.dart' as _i3;
import 'guards/auth_guard.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i5.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    LoginRouter.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    JokesRouter.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(key: args.key));
    },
    JokesRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.JokesPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(EmptyRouterRoute.name, path: '/', children: [
          _i1.RouteConfig('#redirect',
              path: '',
              parent: EmptyRouterRoute.name,
              redirectTo: 'jokes',
              fullMatch: true),
          _i1.RouteConfig(LoginRouter.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
              children: [
                _i1.RouteConfig(LoginRoute.name,
                    path: '', parent: LoginRouter.name)
              ]),
          _i1.RouteConfig(JokesRouter.name,
              path: 'jokes',
              parent: EmptyRouterRoute.name,
              guards: [
                authGuard
              ],
              children: [
                _i1.RouteConfig(JokesRoute.name,
                    path: '', parent: JokesRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i1.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i1.PageRouteInfo>? children})
      : super(EmptyRouterRoute.name, path: '/', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class LoginRouter extends _i1.PageRouteInfo<void> {
  const LoginRouter({List<_i1.PageRouteInfo>? children})
      : super(LoginRouter.name, path: 'login', initialChildren: children);

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class JokesRouter extends _i1.PageRouteInfo<void> {
  const JokesRouter({List<_i1.PageRouteInfo>? children})
      : super(JokesRouter.name, path: 'jokes', initialChildren: children);

  static const String name = 'JokesRouter';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i1.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i4.Key? key})
      : super(LoginRoute.name, path: '', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.JokesPage]
class JokesRoute extends _i1.PageRouteInfo<void> {
  const JokesRoute() : super(JokesRoute.name, path: '');

  static const String name = 'JokesRoute';
}
