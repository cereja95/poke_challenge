import 'package:dartz/dartz.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/repositories/get_pokemons.repository.dart';
import 'get_pokemons.usecase.dart';

class GetPokemonsUsecaseImpl implements GetPokemonsUsecase {
  final GetPokemonsRepository _repository;
  GetPokemonsUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, List<PokemonEntity>>> call() async {
    return await _repository();
  }
}
