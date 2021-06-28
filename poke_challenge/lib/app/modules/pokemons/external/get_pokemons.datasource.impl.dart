import 'package:dio/dio.dart';
import 'package:poke_challenge/app/core/shared/failures/failure_system.dart';
import 'package:poke_challenge/app/modules/pokemons/data/datasources/get_pokemons.datasource.dart';
import 'package:poke_challenge/app/modules/pokemons/data/models/pokemon.model.dart';

class GetPokemonsDatasourceImpl implements GetPokemonsDatasource {
  static const String ROUTE = '/pokemon';

  final Dio _dio;
  GetPokemonsDatasourceImpl(this._dio);

  @override
  Future<List<PokemonModel>> call() async {
    String route = ROUTE;
    try {
      var result = await _dio.get(route);
      List list = result.data["results"];
      return list.map((json) => PokemonModel.fromJson(json)).toList();
    } catch (error) {
      return throw FailureSystem(type: ErrorSystem.CONNECTION);
    }
  }
}
