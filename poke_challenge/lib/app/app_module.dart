import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_challenge/app/core/utils/routes.dart';
import 'package:poke_challenge/app/modules/auth/auth_module.dart';
import 'package:poke_challenge/app/modules/pokemons/pokemons_module.dart';
import 'app_controller.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute(Routes.POKEMONS, module: PokemonsModule()),
  ];
}
