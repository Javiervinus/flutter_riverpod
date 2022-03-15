import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/src/features/authentication/logic/auth_provider.dart';
import 'package:riverpod_tutorial/src/routes/app_router.gr.dart';

class BtnLogin extends ConsumerWidget {
  const BtnLogin(
    this.userController,
    this.passwordController, {
    Key? key,
  }) : super(key: key);
  final TextEditingController userController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(authNotifierProvider);

    return InkWell(
      onTap: () {
        if (state.mapOrNull(data: (master) => master) == null) {
          context
              .read(authNotifierProvider.notifier)
              .login(userController.text, passwordController.text, context);
        } else {
          AutoRouter.of(context).navigate(JokesRouter());
        }

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.blue),
          child: state.when(
              initial: () => const Center(
                    child: Text(
                      "INICIAR SESIÓN",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
              loading: () => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
              data: (master) => Center(
                    child: Text(
                      "${master.usuario?.nombre}",
                      style: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
              error: (error) {
                return const Center(
                  child: Text(
                    "INICIAR SESIÓN",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                );
              })),
    );
  }
}
