import 'package:dartz/dartz.dart';
import 'package:poke_challenge/app/modules/pokemons/data/datasources/get_pokemons.datasource.dart';
import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon.model.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/repositories/get_pokemons.repository.dart';

class GetPokemonsRepositoryImpl implements GetPokemonsRepository {
  final GetPokemonsDatasource _datasource;
  GetPokemonsRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, List<PokemonEntity>>> call() async {
    try {
      var result = await _datasource();
      return Right(
          result.map((model) => PokemonModel.toEntity(model)!).toList());
    } catch (error) {
      return Left(error as Exception);
    }
  }
}
