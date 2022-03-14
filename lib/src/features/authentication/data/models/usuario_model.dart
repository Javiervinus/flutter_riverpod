import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'usuario_model.g.dart';

@JsonSerializable()
class UsuarioModel extends Equatable {
  final int? id;
  final String? nombre;
  final String? correo;
  final String? tipo;

  const UsuarioModel(this.id, this.nombre, this.correo, this.tipo);
  factory UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        nombre,
        correo,
        tipo,
      ];
}
