///app.dart

import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/src/routes/app_router.gr.dart';
import 'package:riverpod_tutorial/src/routes/guards/auth_guard.dart';

import 'features/jokes/views/jokes_page.dart';

class RiverpodJokesApp extends StatelessWidget {
  RiverpodJokesApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Curso",
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "lato"),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
