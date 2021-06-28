import 'package:dartz/dartz.dart';
import 'package:poke_challenge/app/modules/pokemons/data/datasources/get_pokemon.datasource.dart';
import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon.model.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/repositories/get_pokemon.repository.dart';

class GetPokemonRepositoryImpl implements GetPokemonRepository {
  final GetPokemonDatasource _datasource;
  GetPokemonRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, PokemonEntity>> call(String name) async {
    try {
      var result = await _datasource(name);
      return Right(PokemonModel.toEntity(result)!);
    } catch (error) {
      return Left(error as Exception);
    }
  }
}
