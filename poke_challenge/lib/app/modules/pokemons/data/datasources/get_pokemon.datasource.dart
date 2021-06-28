import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon.model.dart';

abstract class GetPokemonDatasource {
  Future<PokemonModel> call(String name);
}
