import 'package:json_annotation/json_annotation.dart';
import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon_type.model.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_types.entity.dart';
part 'pokemon_types.model.g.dart';

@JsonSerializable()
class PokemonTypesModel {
  PokemonTypeModel? type;

  PokemonTypesModel({this.type});

  factory PokemonTypesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypesModelToJson(this);

  static PokemonTypesEntity? toEntity(PokemonTypesModel? model) {
    return model == null
        ? null
        : PokemonTypesEntity(
            type: model.type == null
                ? null
                : PokemonTypeModel.toEntity(model.type));
  }
}
