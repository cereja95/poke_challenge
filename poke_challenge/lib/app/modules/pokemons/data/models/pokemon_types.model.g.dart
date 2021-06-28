// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_types.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonTypesModel _$PokemonTypesModelFromJson(Map<String, dynamic> json) {
  return PokemonTypesModel(
    type: json['type'] == null
        ? null
        : PokemonTypeModel.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonTypesModelToJson(PokemonTypesModel instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
