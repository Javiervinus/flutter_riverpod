import 'package:auto_route/auto_route.dart';
import 'package:riverpod_tutorial/src/features/authentication/data/repositories/auth_repository.dart';
import 'package:riverpod_tutorial/src/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  final IAuthRepository _authRepository = AuthRepository();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("master") || _authRepository.esAnonimo) {
      resolver.next(true);
    } else {
      router.replace(const LoginRouter());
    }
  }
}
