import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_challenge/app/core/utils/constants.dart';
import 'package:poke_challenge/app/core/utils/routes.dart';
import 'package:poke_challenge/app/modules/pokemons/data/repositories/get_pokemons.repository.impl.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/usecases/get_pokemons.usecase.impl.dart';
import 'package:poke_challenge/app/modules/pokemons/external/get_pokemons.datasource.impl.dart';
import 'package:poke_challenge/app/modules/pokemons/presentation/controllers/pokemon_detail_controller.dart';
import 'package:poke_challenge/app/modules/pokemons/presentation/pages/pokemon_detail_page.dart';
import 'data/repositories/get_pokemon.repository.impl.dart';
import 'domain/usecases/get_pokemon.usecase.impl.dart';
import 'external/get_pokemon.datasource.impl.dart';
import 'presentation/controllers/pokemons_controller.dart';
import 'presentation/pages/pokemons_page.dart';

import 'package:dio/dio.dart';

class PokemonsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio(BaseOptions(baseUrl: Constants.ENDPOINT))),
    Bind((i) => GetPokemonsUsecaseImpl(GetPokemonsRepositoryImpl(i.get()))),
    Bind((i) => GetPokemonsDatasourceImpl(i.get())),
    Bind((i) => GetPokemonUsecaseImpl(GetPokemonRepositoryImpl(i.get()))),
    Bind((i) => GetPokemonDatasourceImpl(i.get())),
    Bind.lazySingleton((i) => PokemonsController(i.get())),
    Bind.lazySingleton((i) => PokemonDetailController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PokemonsPage()),
    ChildRoute(Routes.DETAIL, child: (_, args) => PokemonDetailPage()),
  ];
}
