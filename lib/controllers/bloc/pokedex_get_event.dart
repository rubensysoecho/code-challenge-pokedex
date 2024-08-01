part of 'pokedex_get_bloc.dart';

@immutable
sealed class PokedexGetEvent {}

final class PokedexGetKantoPokemon extends PokedexGetEvent {}

final class PokedexGetSearchedPokemon extends PokedexGetEvent {
  final String pokemonName;

  PokedexGetSearchedPokemon({required this.pokemonName});
}


