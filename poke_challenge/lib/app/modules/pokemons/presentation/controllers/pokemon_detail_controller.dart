import 'package:mobx/mobx.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon_stats.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/usecases/get_pokemon.usecase.dart';
part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class PokemonDetailControllerBase with Store {
  final GetPokemonUsecase usecase;
  PokemonDetailControllerBase(this.usecase);

  @observable
  bool isLoading = false;

  @action
  changeLoading(value) => isLoading = value;

  @observable
  bool isError = false;

  @action
  changeError(value) => isError = value;

  @observable
  PokemonEntity? pokemon;

  @action
  changePokemon(value) => pokemon = value;

  String? name;

  void getPokemon() async {
    changeError(false);
    changeLoading(true);
    var result = await usecase(name ?? "");
    changeLoading(false);
    result.fold((error) {
      changeError(true);
    }, (response) {
      changePokemon(response);
    });
  }

  String getStatItem(key) {
    List<PokemonStatsEntity> list = pokemon?.stats
            ?.where((element) => element.stat?.name == key)
            .toList() ??
        [];

    if (list.length == 0) {
      return "";
    }
    return (list.first.baseStat ?? 0).toString();
  }
}
