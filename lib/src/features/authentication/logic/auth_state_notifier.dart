part of 'auth_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _authRepository;

  AuthNotifier({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.initial()) {
    loadStorage();
  }

  Future<void> login(
      String usuario, String contrasena, BuildContext context) async {
    state = const AuthState.loading();
    try {
      final master = await _authRepository.login(usuario, contrasena);
      state = AuthState.data(master: master);
      UsuarioModel user = master.usuario!;
      saveStorage(master);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Bienvenido " + user.nombre!)));
      AutoRouter.of(context).replace(JokesRouter());
    } catch (_) {
      state = const AuthState.error("Error al iniciar sesion");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Datos incorrectos")));
    }
  }

  logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_authRepository.logOut()) {
      prefs.remove("master");
      state = const AuthState.initial();
      AutoRouter.of(context).replace(const LoginRouter());
    }
  }

  Future<void> loadStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("master")) {
      MasterModel master =
          MasterModel.fromJson(jsonDecode(prefs.getString("master")!));
      _authRepository.master = master;
      state = AuthState.data(master: master);
    } else {
      print("no se enncontro");
      state = const AuthState.initial();
    }
  }

  saveStorage(MasterModel master) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final str = jsonEncode(master.toJson());
    prefs.setString("master", str);
  }

  MasterModel? master() {
    return _authRepository.master;
  }
}
