import 'package:dio/dio.dart';
import 'package:riverpod_tutorial/src/core/enviroment_config.dart';
import 'package:riverpod_tutorial/src/features/authentication/data/models/master_model.dart';

abstract class IAuthRepository {
  Future<MasterModel> login(String usuario, String contrasena);
  MasterModel? master;
}

class AuthRepository implements IAuthRepository {
  final _dioClient = Dio();

  @override
  Future<MasterModel> login(String usuario, String contrasena) async {
    try {
      final result = await _dioClient
          .post(EnvironmentConfig.apiUrl + "auth/login/admin-empresas");
      if (result.statusCode == 200) {
        master = result.data;
        return MasterModel.fromJson(result.data);
      } else {
        throw Exception();
      }
    } catch (_) {
      throw Exception();
    }
  }

  @override
  MasterModel? master;
}
