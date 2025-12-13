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
          child: Column(
            children: [
              headerText(context),
              SizedBox(height: 20),
              pokemonContainer(),
              SizedBox(height: 20),
              menu(),
            ],
          ),
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

        Expanded(
          child: Column(
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
        ),
      ],
    );
  }

  Color getColorByType(String type) {
    switch (type) {
      case "Fire":
        return Colors.redAccent;
      case "Water":
        return Colors.blueAccent;
      case "Grass":
        return Colors.greenAccent;
      default:
        return Colors.grey;
    }
  }

  Widget pokemonContainer() {
    return Container(
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: getColorByType(pokemon.type),
      ),
      child: Image.network(
        pokemon.imageUrl,
        fit: BoxFit.contain,
        width: 300,
        height: 400,
      ),
    );
  }

  Widget menu() {
    final tabs = ["Forms", "Detail", "Types", "Stats", "Weakness"];

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: tabs.map((tab) {
          final isActive = tab == tabs.first;

          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              tab,
              style: TextStyle(
                fontSize: 20,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive
                    ? Colors.deepPurple
                    : const Color.fromARGB(255, 173, 145, 223),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
