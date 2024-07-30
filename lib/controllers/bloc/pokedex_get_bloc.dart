import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';

part 'pokedex_get_event.dart';
part 'pokedex_get_state.dart';

class PokedexGetBloc extends Bloc<PokedexGetEvent, PokedexGetState> {
  PokedexGetBloc() : super(PokedexGetInitial()) {
    on<PokedexGetKantoPokemon>((event, emit) {
      


    });
  }
}
