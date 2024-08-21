import 'package:code_challenge_pokedex/views/01_Pokedex.dart';
import 'package:code_challenge_pokedex/views/02_Captured.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controllers/bloc/pokedex_get_bloc.dart';
import '../models/pokemon.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.pokemonList, required this.pokeBloc});
  final List<Pokemon> pokemonList;
  final PokedexGetBloc pokeBloc;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Pokemon> pokemonList = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pokemonList = widget.pokemonList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pokédex',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Capturados',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          PokedexPage(pokemonList: pokemonList, pokeBloc: widget.pokeBloc,),
          const CapturedPage(),
        ],
      ),
    );
  }
}
