import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_stats.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_types.entity.dart';

class PokemonEntity {
  int? id;
  String? name;
  int? weight;
  int? height;
  List<PokemonStatsEntity>? stats;
  List<PokemonTypesEntity>? types;

  PokemonEntity(
      {this.height, this.name, this.stats, this.types, this.weight, this.id});
}
