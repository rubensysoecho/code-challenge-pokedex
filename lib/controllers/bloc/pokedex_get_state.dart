part of 'pokedex_get_bloc.dart';

@immutable
sealed class PokedexGetState {}

final class PokedexGetInitial extends PokedexGetState {}

final class PokedexGetLoading extends PokedexGetState {}

final class PokedexGetLoaded extends PokedexGetState {
  final List<Pokemon> pokemonList;

  PokedexGetLoaded({required this.pokemonList});
}

final class PokedexGetFounded extends PokedexGetState {
  final Pokemon foundedPokemon;

  PokedexGetFounded({required this.foundedPokemon});
}

final class PokedexGetFailed extends PokedexGetState {
  final String error;

  PokedexGetFailed({required this.error});
}