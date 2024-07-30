part of 'pokedex_get_bloc.dart';

@immutable
sealed class PokedexGetState {}

final class PokedexGetInitial extends PokedexGetState {}

final class PokedexGetLoading extends PokedexGetState {}

final class PokedexGetLoaded extends PokedexGetState {}

final class PokedexGetFailed extends PokedexGetState {}
