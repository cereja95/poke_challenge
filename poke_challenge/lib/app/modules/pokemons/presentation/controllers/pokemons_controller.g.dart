// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonsController on PokemonsControllerBase, Store {
  final _$isLoadingAtom = Atom(name: 'PokemonsControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isErrorAtom = Atom(name: 'PokemonsControllerBase.isError');

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  final _$pokemonsAtom = Atom(name: 'PokemonsControllerBase.pokemons');

  @override
  List<PokemonEntity> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonEntity> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$PokemonsControllerBaseActionController =
      ActionController(name: 'PokemonsControllerBase');

  @override
  dynamic changeLoading(dynamic value) {
    final _$actionInfo = _$PokemonsControllerBaseActionController.startAction(
        name: 'PokemonsControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$PokemonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeError(dynamic value) {
    final _$actionInfo = _$PokemonsControllerBaseActionController.startAction(
        name: 'PokemonsControllerBase.changeError');
    try {
      return super.changeError(value);
    } finally {
      _$PokemonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePokemons(dynamic value) {
    final _$actionInfo = _$PokemonsControllerBaseActionController.startAction(
        name: 'PokemonsControllerBase.changePokemons');
    try {
      return super.changePokemons(value);
    } finally {
      _$PokemonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
pokemons: ${pokemons}
    ''';
  }
}
