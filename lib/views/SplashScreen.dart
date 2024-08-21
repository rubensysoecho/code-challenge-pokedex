import 'dart:math';

import 'package:code_challenge_pokedex/views/01_Pokedex.dart';
import 'package:code_challenge_pokedex/views/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/bloc/pokedex_get_bloc.dart';
import '../models/pokemon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PokedexGetBloc pokeBloc;
  List<Pokemon> pokemonList = [];

  @override
  void initState() {
    super.initState();
    pokeBloc = PokedexGetBloc();
    pokeBloc.add(PokedexGetKantoPokemon());
  }

  @override
  void dispose() {
    super.dispose();
    pokeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokedexGetBloc, PokedexGetState>(
      bloc: pokeBloc,
      listener: (context, state) {
        if (state is PokedexGetLoaded) {
          print('=> ${state.pokemonList.length} Pokemon loaded');
          pokemonList = state.pokemonList;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(
                pokemonList: pokemonList,
                pokeBloc: pokeBloc,
              ),
            ),
          );
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
        return Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgrounds/splash_bg.gif'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: const CupertinoActivityIndicator(
                  color: Colors.red,
                  radius: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
