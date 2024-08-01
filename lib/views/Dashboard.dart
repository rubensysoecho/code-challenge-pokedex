import 'package:code_challenge_pokedex/views/01_Pokedex.dart';
import 'package:code_challenge_pokedex/views/02_Captured.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController pokemonSearchController;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PokedexPage(),
    CapturedPage(),
  ];

  void submit() {
    Navigator.of(context).pop(pokemonSearchController.text);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pokemonSearchController = TextEditingController();
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
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            PokedexPage(),
            CapturedPage(),
          ],
        ));
  }
}
