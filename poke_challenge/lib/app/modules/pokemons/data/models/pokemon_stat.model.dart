import 'package:json_annotation/json_annotation.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_stat.entity.dart';

part 'pokemon_stat.model.g.dart';

@JsonSerializable()
class PokemonStatModel {
  String? name;

  PokemonStatModel({this.name});

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatModelToJson(this);

  static PokemonStatEntity? toEntity(PokemonStatModel? model) {
    return model == null ? null : PokemonStatEntity(name: model.name);
  }
}
