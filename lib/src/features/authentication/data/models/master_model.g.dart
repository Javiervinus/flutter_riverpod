// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterModel _$MasterModelFromJson(Map<String, dynamic> json) {
  return MasterModel(
    json['idEmpresa'] as int?,
    json['usuario'] == null
        ? null
        : UsuarioModel.fromJson(json['usuario'] as Map<String, dynamic>),
    json['rol'] as String?,
    json['access_token'] as String?,
  );
}

Map<String, dynamic> _$MasterModelToJson(MasterModel instance) =>
    <String, dynamic>{
      'idEmpresa': instance.idEmpresa,
      'usuario': instance.usuario,
      'rol': instance.rol,
      'access_token': instance.accessToken,
    };
