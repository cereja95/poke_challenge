import 'package:mobx/mobx.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/entities/pokemon.entity.dart';
import 'package:poke_challenge/app/modules/pokemons/domain/usecases/get_pokemons.usecase.dart';
part 'pokemons_controller.g.dart';

class PokemonsController = PokemonsControllerBase with _$PokemonsController;

abstract class PokemonsControllerBase with Store {
  final GetPokemonsUsecase usecase;
  PokemonsControllerBase(this.usecase);

  @observable
  bool isLoading = false;

  @action
  changeLoading(value) => isLoading = value;

  @observable
  bool isError = false;

  @action
  changeError(value) => isError = value;

  @observable
  List<PokemonEntity> pokemons = [];

  @action
  changePokemons(value) => pokemons = value;

  void getPokemons() async {
    changeError(false);
    changeLoading(true);
    var result = await usecase();
    changeLoading(false);
    result.fold((error) {
      changeError(true);
    }, (response) {
      changePokemons(response);
    });
  }
}
