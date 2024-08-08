import 'package:code_challenge_pokedex/views/03_PokeDetails.dart';
import 'package:flutter/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../models/pokemon.dart';
import '../utils/color_managment.dart';

class PokeContainer extends StatefulWidget {
  final Pokemon pk;
  PokeContainer({super.key, required this.pk});

  @override
  State<PokeContainer> createState() => _PokeContainerState();
}

class _PokeContainerState extends State<PokeContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokeDetails(pk: widget.pk),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          image: DecorationImage(
            image: NetworkImage('${widget.pk.thumbnailUrl}'),
            fit: BoxFit.fill,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorManagment.getColor('${widget.pk.type}'),
              ),
              child: Text(
                '${widget.pk.name?.capitalize()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
