import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon.model.dart';

abstract class GetPokemonsDatasource {
  Future<List<PokemonModel>> call();
}
