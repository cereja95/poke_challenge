import 'package:json_annotation/json_annotation.dart';
import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon_types.model.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';
import 'pokemon_stats.model.dart';
part 'pokemon.model.g.dart';

@JsonSerializable()
class PokemonModel {
  int? id;
  String? name;
  int? weight;
  int? height;
  @JsonKey(name: "stats")
  List<PokemonStatsModel>? stats;
  @JsonKey(name: "types")
  List<PokemonTypesModel>? types;

  PokemonModel(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.stats,
      required this.types});

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  static PokemonEntity? toEntity(PokemonModel? model) {
    return model == null
        ? null
        : PokemonEntity(
            id: model.id,
            height: model.height,
            weight: model.weight,
            name: model.name,
            stats: model.stats == null
                ? null
                : model.stats!
                    .map((item) => PokemonStatsModel.toEntity(item)!)
                    .toList(),
            types: model.types == null
                ? null
                : model.types!
                    .map((item) => PokemonTypesModel.toEntity(item)!)
                    .toList());
  }
}
