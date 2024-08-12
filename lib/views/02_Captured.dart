import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class CapturedPage extends StatefulWidget {
  const CapturedPage({super.key});

  @override
  State<CapturedPage> createState() => _CapturedPageState();
}

class _CapturedPageState extends State<CapturedPage> {
  List<Pokemon> catchedPokemons = [];

  @override
  void initState() async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
