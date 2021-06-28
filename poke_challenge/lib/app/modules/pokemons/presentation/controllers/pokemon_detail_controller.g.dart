// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailController on PokemonDetailControllerBase, Store {
  final _$isLoadingAtom = Atom(name: 'PokemonDetailControllerBase.isLoading');

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

  final _$isErrorAtom = Atom(name: 'PokemonDetailControllerBase.isError');

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

  final _$pokemonAtom = Atom(name: 'PokemonDetailControllerBase.pokemon');

  @override
  PokemonEntity? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonEntity? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$PokemonDetailControllerBaseActionController =
      ActionController(name: 'PokemonDetailControllerBase');

  @override
  dynamic changeLoading(dynamic value) {
    final _$actionInfo = _$PokemonDetailControllerBaseActionController
        .startAction(name: 'PokemonDetailControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeError(dynamic value) {
    final _$actionInfo = _$PokemonDetailControllerBaseActionController
        .startAction(name: 'PokemonDetailControllerBase.changeError');
    try {
      return super.changeError(value);
    } finally {
      _$PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePokemon(dynamic value) {
    final _$actionInfo = _$PokemonDetailControllerBaseActionController
        .startAction(name: 'PokemonDetailControllerBase.changePokemon');
    try {
      return super.changePokemon(value);
    } finally {
      _$PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
pokemon: ${pokemon}
    ''';
  }
}
