import 'package:json_annotation/json_annotation.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_stats.entity.dart';

import 'pokemon_stat.model.dart';
part 'pokemon_stats.model.g.dart';

@JsonSerializable()
class PokemonStatsModel {
  @JsonKey(name: "base_stat")
  int? baseStat;
  PokemonStatModel? stat;

  PokemonStatsModel({required this.stat, required this.baseStat});

  factory PokemonStatsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatsModelToJson(this);

  static PokemonStatsEntity? toEntity(PokemonStatsModel? model) {
    return model == null
        ? null
        : PokemonStatsEntity(
            baseStat: model.baseStat,
            stat: model.stat == null
                ? null
                : PokemonStatModel.toEntity(model.stat));
  }
}
