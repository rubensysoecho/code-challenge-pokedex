import 'package:code_challenge_pokedex/views/01_Pokedex.dart';
import 'package:code_challenge_pokedex/views/02_Captured.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controllers/bloc/pokedex_get_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

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
        children: const [
          PokedexPage(),
          CapturedPage(),
        ],
      ),
    );
  }
}
