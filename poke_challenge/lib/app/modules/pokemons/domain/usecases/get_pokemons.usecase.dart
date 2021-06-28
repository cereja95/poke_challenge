import 'package:dartz/dartz.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';

abstract class GetPokemonsUsecase {
  Future<Either<Exception, List<PokemonEntity>>> call();
}
