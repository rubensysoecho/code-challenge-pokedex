import 'package:flutter/material.dart';

class ColorManagment {
  static Color getColor(String pokemonType) {
    switch (pokemonType) {
      case 'bug':
        return const Color.fromRGBO(40, 73, 41, 1);
      case 'dark':
        return const Color.fromRGBO(90, 89, 119, 1);
      case 'dragon':
        return const Color.fromRGBO(86, 137, 147, 1);
      case 'electric':
        return const Color.fromRGBO(227, 227, 85, 1);
      case 'fairy':
        return const Color.fromRGBO(138, 38, 68, 1);
      case 'fighting':
        return const Color.fromRGBO(142, 69, 45, 1);
      case 'fire':
        return const Color.fromRGBO(152, 45, 41, 1);
      case 'flying':
        return const Color.fromRGBO(80, 102, 123, 1);
      case 'ghost':
        return const Color.fromRGBO(51, 51, 103, 1);
      case 'grass':
        return const Color.fromRGBO(57, 121, 67, 1);
      case 'ground':
        return const Color.fromRGBO(161, 114, 57, 1);
      case 'ice':
        return const Color.fromRGBO(151, 208, 241, 1);
      case 'normal':
        return const Color.fromRGBO(112, 82, 91, 1);
      case 'poison':
        return const Color.fromRGBO(88, 48, 131, 1);
      case 'psychic':
        return const Color.fromRGBO(151, 52, 106, 1);
      case 'rock':
        return const Color.fromRGBO(66, 27, 15, 1);
      case 'steel':
        return const Color.fromRGBO(99, 116, 109, 1);
      case 'water':
        return const Color.fromRGBO(40, 81, 218, 1);
      default:
        return Colors.white;
    }
  }
}
