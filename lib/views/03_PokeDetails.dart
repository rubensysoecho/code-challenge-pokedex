import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokeDetails extends StatefulWidget {
  final Pokemon pk;
  const PokeDetails({super.key, required this.pk});

  @override
  State<PokeDetails> createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(widget.pk.thumbnailUrl!),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Text(
                  widget.pk.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'ID: ${widget.pk.id}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Text(
            'Altura: ${widget.pk.height} cm',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Text(
            'Peso: ${widget.pk.weight} g',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}
