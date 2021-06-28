import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_stat.entity.dart';

class PokemonStatsEntity {
  int? baseStat;
  PokemonStatEntity? stat;
  PokemonStatsEntity({this.baseStat, this.stat});
}
