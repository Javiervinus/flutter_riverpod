import 'package:dio/dio.dart';
import 'package:riverpod_tutorial/src/core/env/enviroment_config.dart';
import 'package:riverpod_tutorial/src/features/authentication/data/models/master_model.dart';

abstract class IAuthRepository {
  Future<MasterModel> login(String usuario, String contrasena);
  bool logOut();
  bool esAnonimo = false;
  MasterModel? master;
}

class AuthRepository implements IAuthRepository {
  final _dioClient = Dio();

  @override
  Future<MasterModel> login(String usuario, String contrasena) async {
    try {
      var data = {"usuario": usuario, "contrasena": contrasena};
      final result = await _dioClient.post(
          EnvironmentConfig.apiUrl + "auth/login/admin-empresas",
          data: data);
      if (result.statusCode == 201) {
        master = MasterModel.fromJson(result.data);
        esAnonimo = false;
        return MasterModel.fromJson(result.data);
      } else {
        throw Exception();
      }
    } catch (_) {
      throw Exception();
    }
  }

  @override
  bool logOut() {
    master = null;
    esAnonimo = false;
    return true;
  }

  @override
  MasterModel? master;

  @override
  bool esAnonimo = false;
}
