import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:code_challenge_pokedex/models/pokemon.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'pokedex_get_event.dart';
part 'pokedex_get_state.dart';

class PokedexGetBloc extends Bloc<PokedexGetEvent, PokedexGetState> {
  PokedexGetBloc() : super(PokedexGetInitial()) {
    on<PokedexGetKantoPokemon>((event, emit) async {
      try {
        List<Pokemon> pokemonList = [];
        emit(PokedexGetLoading());
        final url = Uri.parse("https://pokeapi.co/api/v2/pokedex/2/");
        final res = await http.get(url);
        final body = jsonDecode(res.body);
        final pokemonResList = body['pokemon_entries'];
        for(var pokemon in pokemonResList) {
          var pokeUrl = pokemon['pokemon_species']['url'];
          var pokeParsedUrl = Uri.parse(pokeUrl);
          var pokeRes = await http.get(pokeParsedUrl);
          var pokeBody = jsonDecode(pokeRes.body);
          var id = pokeBody['id'];
          var name = pokeBody['name'];

          pokeUrl = 'https://pokeapi.co/api/v2/pokemon/${pokeBody['name']}';
          pokeParsedUrl = Uri.parse(pokeUrl);
          pokeRes = await http.get(pokeParsedUrl);
          pokeBody = jsonDecode(pokeRes.body);

          Pokemon pk = Pokemon(id: id, name: name, height: pokeBody['height'], weight: pokeBody['weight'], thumbnailUrl: pokeBody['sprites']['front_default']);
          pokemonList.add(pk);
        }
        print('Pokemons loaded');
        return emit(PokedexGetLoaded(pokemonList: pokemonList));
      } catch (e) {
        return emit(PokedexGetFailed());
      }
    });
  }
}
