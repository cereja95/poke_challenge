import 'package:dartz/dartz.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/repositories/get_pokemon.repository.dart';
import 'get_pokemon.usecase.dart';

class GetPokemonUsecaseImpl implements GetPokemonUsecase {
  final GetPokemonRepository _repository;
  GetPokemonUsecaseImpl(this._repository);

  @override
  Future<Either<Exception, PokemonEntity>> call(String name) async {
    return await _repository(name);
  }
}
