import 'package:json_annotation/json_annotation.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_type.entity.dart';
part 'pokemon_type.model.g.dart';

@JsonSerializable()
class PokemonTypeModel {
  String? name;

  PokemonTypeModel({required this.name});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeModelToJson(this);

  static PokemonTypeEntity? toEntity(PokemonTypeModel? model) {
    return model == null ? null : PokemonTypeEntity(name: model.name);
  }
}
