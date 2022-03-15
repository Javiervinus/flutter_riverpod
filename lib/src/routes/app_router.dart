import 'package:auto_route/auto_route.dart';
import 'package:riverpod_tutorial/src/features/authentication/views/login_page.dart';
import 'package:riverpod_tutorial/src/features/jokes/views/jokes_page.dart';
import 'package:riverpod_tutorial/src/routes/guards/auth_guard.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: EmptyRouterPage, path: '/', children: [
    AutoRoute(
        path: 'login',
        name: 'LoginRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: LoginPage,
          ),
        ]),
    AutoRoute(
        path: 'jokes',
        name: 'JokesRouter',
        initial: true,
        guards: [AuthGuard],
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: JokesPage,
          ),
        ]),
  ])
])
class $AppRouter {}
