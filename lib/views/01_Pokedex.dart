import 'package:code_challenge_pokedex/widgets/PokeContainer.dart';
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
  late TextEditingController pokemonSearchController;
  late PokedexGetBloc pokeBloc;
  List<Pokemon> pokemonList = [];

  @override
  void initState() {
    super.initState();
    pokeBloc = PokedexGetBloc();
    pokeBloc.add(PokedexGetKantoPokemon());
    pokemonSearchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    pokeBloc.close();
  }

  void submit() {
    pokeBloc.add(PokedexGetSearchedPokemon(pokemonName: pokemonSearchController.value.text.toLowerCase()));
    Navigator.of(context).pop(pokemonSearchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.search),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Introduzca el nombre del Pokemon'),
                content: TextField(
                  controller: pokemonSearchController,
                  cursorColor: Colors.red,
                ),
                actions: [
                  TextButton(onPressed: submit, child: const Icon(Icons.search))
                ],
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocConsumer<PokedexGetBloc, PokedexGetState>(
        bloc: pokeBloc,
        listener: (context, state) {
          if (state is PokedexGetFounded) {
            setState(() {
              pokemonList = [];
            });
            pokemonList.add(state.foundedPokemon);
          }
          if (state is PokedexGetLoaded) {
            print('=> ${state.pokemonList.length} Pokemon loaded');
            pokemonList = state.pokemonList;
          }
          if (state is PokedexGetFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
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
          if (state is PokedexGetFailed) {
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
              crossAxisCount: 3,
            ),
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PokeContainer(
                  pk: pokemonList[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
