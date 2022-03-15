import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_tutorial/src/features/authentication/data/models/usuario_model.dart';

part 'master_model.g.dart';

@JsonSerializable()
class MasterModel extends Equatable {
  final int? idEmpresa;
  final UsuarioModel? usuario;
  final String? rol;
  @JsonKey(name: "access_token")
  final String? accessToken;

  const MasterModel(this.idEmpresa, this.usuario, this.rol, this.accessToken);

  factory MasterModel.fromJson(Map<String, dynamic> json) =>
      _$MasterModelFromJson(json);

  Map<String, dynamic> toJson() => _$MasterModelToJson(this);
  @override
  List<Object?> get props => [idEmpresa, usuario, rol, accessToken];
}
