import 'package:flutter/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../models/pokemon.dart';

class PokeDetailsTile extends StatefulWidget {
  const PokeDetailsTile({super.key, required this.pk});
  final Pokemon pk;

  @override
  State<PokeDetailsTile> createState() => _PokeDetailsTileState();
}

class _PokeDetailsTileState extends State<PokeDetailsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '${widget.pk.name!.capitalize()}  #${widget.pk.id}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Kanto',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red),
              padding: WidgetStatePropertyAll(EdgeInsets.all(18))
            ),
            child: const Icon(
              Icons.shopping_bag_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
