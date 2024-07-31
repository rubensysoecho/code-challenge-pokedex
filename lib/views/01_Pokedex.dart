import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/bloc/pokedex_get_bloc.dart';
import '../models/pokemon.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  late PokedexGetBloc pokeBloc;
  List<Pokemon> pokemonList = [];

  @override
  void initState() {
    super.initState();
    pokeBloc = PokedexGetBloc();
    pokeBloc.add(PokedexGetKantoPokemon());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PokedexGetBloc, PokedexGetState>(
        bloc: pokeBloc,
        listener: (context, state) {
          if (state is PokedexGetLoaded) {
            print('=> ${state.pokemonList.length} Pokemon loaded');
            pokemonList = state.pokemonList;
          }
          if (state is PokedexGetFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ha ocurrido un error al cargar'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PokedexGetLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is PokedexGetFailed)  {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  pokeBloc.add(PokedexGetKantoPokemon());
                },
                child: const Text('Recargar'),
              ),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('$index'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
