import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/src/features/authentication/data/repositories/auth_repository.dart';
import 'package:riverpod_tutorial/src/features/authentication/logic/auth_provider.dart';
import 'package:riverpod_tutorial/src/features/authentication/views/btn_login_widget.dart';
import 'package:riverpod_tutorial/src/routes/app_router.gr.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(authNotifierProvider);
    final repo = watch(authRepositoryProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formUser(userController),
            formPassword(passwordController),
            GestureDetector(
              child: const Text("Ir a jokes"),
              onDoubleTap: () {
                context.read(authRepositoryProvider).esAnonimo = true;
                AutoRouter.of(context).navigate(const JokesRouter());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BtnLogin(userController, passwordController),
            ),
            Text(state.mapOrNull(error: (value) => value.error!) ?? ""),
            Text(state.mapOrNull(data: (value) => value.master.rol!) ?? ""),
          ],
        ),
      ),
    );
  }
}

Widget formUser(TextEditingController userController) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Usuario:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: TextField(
                  controller: userController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 0, left: 10, bottom: 0),
                    fillColor: Colors.white,
                    filled: true,
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget formPassword(TextEditingController passwordController) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contraseña:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 0, left: 10, bottom: 0),
                    fillColor: Colors.white,
                    filled: true,
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
