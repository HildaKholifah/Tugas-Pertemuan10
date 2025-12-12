// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemonapp/model/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: [headerText(context)]),
        ),
      ),
    );
  }

  Widget headerText(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            size: 26,
            color: Colors.deepPurple,
          ),
        ),
        Column(
          children: [
            Text(
              pokemon.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              pokemon.id.toString().padLeft(3, "0"),
              style: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent),
            ),
          ],
        ),
      ],
    );
  }
}
