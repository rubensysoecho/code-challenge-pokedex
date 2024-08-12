import 'package:carousel_slider/carousel_slider.dart';
import 'package:code_challenge_pokedex/widgets/PokeDetailsTile.dart';
import 'package:flutter/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../models/pokemon.dart';

class PokeDetails extends StatefulWidget {
  final Pokemon pk;
  const PokeDetails({super.key, required this.pk});

  @override
  State<PokeDetails> createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails> {
  List<Container> carouselItems = [];

  void fillCarousel() {
    List<String> extraImages = widget.pk.extraImages;
    extraImages.add(widget.pk.thumbnailUrl!);
    for (var extraImage in extraImages) {
      carouselItems.add(
        Container(
          width: double.infinity,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(extraImage),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fillCarousel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(),
          ),
          PokeDetailsTile(pk: widget.pk),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          const SizedBox(
            width: 300,
            child: Divider(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Altura: ${widget.pk.height} cm',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Peso: ${widget.pk.weight} g',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
