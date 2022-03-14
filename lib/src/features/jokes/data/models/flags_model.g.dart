// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlagsModel _$FlagsModelFromJson(Map<String, dynamic> json) {
  return FlagsModel(
    json['explicit'] as bool?,
    json['nsfw'] as bool?,
    json['political'] as bool?,
    json['racist'] as bool?,
    json['religious'] as bool?,
    json['sexist'] as bool?,
  );
}

Map<String, dynamic> _$FlagsModelToJson(FlagsModel instance) =>
    <String, dynamic>{
      'explicit': instance.explicit,
      'nsfw': instance.nsfw,
      'political': instance.political,
      'racist': instance.racist,
      'religious': instance.religious,
      'sexist': instance.sexist,
    };
