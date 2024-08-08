import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:code_challenge_pokedex/models/pokemon.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'pokedex_get_event.dart';
part 'pokedex_get_state.dart';

class PokedexGetBloc extends Bloc<PokedexGetEvent, PokedexGetState> {
  PokedexGetBloc() : super(PokedexGetInitial()) {
    // TODO: Implementar paginación para mejorar rendimiento
    on<PokedexGetKantoPokemon>((event, emit) async {
      try {
        List<Pokemon> pokemonList = [];
        emit(PokedexGetLoading());
        for (int i = 1; i <= 151; i++) {
          final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$i");
          final res = await http.get(url);
          final body = jsonDecode(res.body);
          var id = body['id'];
          var name = body['name'];
          pokemonList.add(
            Pokemon(
              id: id,
              name: name,
              height: body['height'],
              weight: body['weight'],
              thumbnailUrl: body['sprites']['front_default'],
              type: body['types'][0]['type']['name']
            ),
          );
          print('$name added - $i/151');
        }
        print('Pokemons loaded');
        return emit(PokedexGetLoaded(pokemonList: pokemonList));
      } catch (e) {
        return emit(PokedexGetFailed(error: 'Error al obtener pokemons'));
      }
    });

    on<PokedexGetSearchedPokemon>((event, emit) async{
      emit(PokedexGetLoading());
      final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/${event.pokemonName}");
      final res = await http.get(url);
      if (res.statusCode != 200) {
        return emit(PokedexGetFailed(error: "No se ha encontrado el pokemon buscado"));
      }
      final body = jsonDecode(res.body);
      var id = body['id'];
      var name = body['name'];
      Pokemon pk = Pokemon(
          id: id,
          name: name,
          height: body['height'],
          weight: body['weight'],
          thumbnailUrl: body['sprites']['front_default'],
          type: body['types'][0]['type']['name']
      );
      return emit(PokedexGetFounded(foundedPokemon: pk));
    });
  }
}
