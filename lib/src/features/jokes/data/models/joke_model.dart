import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'flags_model.dart';
part 'joke_model.g.dart';

@JsonSerializable()
class JokeModel extends Equatable {
  final String? category;
  final String? delivery;
  final FlagsModel? flags;
  final int? id;
  final String? lang;
  final bool safe;
  final String? setup;
  final String? type;

  const JokeModel(this.category, this.delivery, this.flags, this.id, this.lang,
      this.safe, this.setup, this.type);
  //Json Serializable
  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);

  Map<String, dynamic> toJson() => _$JokeModelToJson(this);
  @override
  List<Object?> get props => [
        category,
        delivery,
        flags,
        id,
        lang,
        safe,
        setup,
        type,
      ];
}
