// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stats.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStatsModel _$PokemonStatsModelFromJson(Map<String, dynamic> json) {
  return PokemonStatsModel(
    stat: json['stat'] == null
        ? null
        : PokemonStatModel.fromJson(json['stat'] as Map<String, dynamic>),
    baseStat: json['base_stat'] as int?,
  );
}

Map<String, dynamic> _$PokemonStatsModelToJson(PokemonStatsModel instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };
