import 'package:dio/dio.dart';
import 'package:poke_challenge/app/core/shared/failures/failure_system.dart';
import 'package:poke_challenge/app/modules/pokemons/data/datasources/get_pokemon.datasource.dart';
import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon.model.dart';

class GetPokemonDatasourceImpl implements GetPokemonDatasource {
  static const String ROUTE = '/pokemon/';

  final Dio _dio;
  GetPokemonDatasourceImpl(this._dio);

  @override
  Future<PokemonModel> call(String name) async {
    String route = ROUTE;
    try {
      var result = await _dio.get(route + name);
      return PokemonModel.fromJson(result.data);
    } catch (error) {
      return throw FailureSystem(type: ErrorSystem.CONNECTION);
    }
  }
}
