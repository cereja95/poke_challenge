import 'package:dartz/dartz.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';

abstract class GetPokemonsRepository {
  Future<Either<Exception, List<PokemonEntity>>> call();
}
