import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import 'PokeContainer.dart';

class PokeGridView extends StatelessWidget {
  final List<Pokemon> pokemonList;
  const PokeGridView({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
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
  }
}
