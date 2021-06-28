// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return PokemonModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    height: json['height'] as int?,
    weight: json['weight'] as int?,
    stats: (json['stats'] as List<dynamic>?)
        ?.map((e) => PokemonStatsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    types: (json['types'] as List<dynamic>?)
        ?.map((e) => PokemonTypesModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'stats': instance.stats,
      'types': instance.types,
    };
