import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokemonapp/detail_page.dart';
import 'package:pokemonapp/model/dummy_data.dart';
import 'package:pokemonapp/shared/widget/pokemon_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchName = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerText(),
              SizedBox(height: 20),
              searchBar(searchName),
              SizedBox(height: 20),
              listPokemon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pokedex",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "Search a pokemon by name or using its National Pokedex number.",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget searchBar(TextEditingController searchName) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          child: TextFormField(
            controller: searchName,
            decoration: InputDecoration(
              hintText: "Search a Pokemon",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.deepPurple,
          ),
          child: Icon(Icons.filter_list),
        ),
      ],
    );
  }

  Widget listPokemon() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
        ),
        itemCount: dummyPokemonList.length,
        itemBuilder: (context, index) {
          return PokemonCardWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(pokemon: dummyPokemonList[index]),
                ),
              );
            },
            imageUrl: dummyPokemonList[index].imageUrl,
            name: dummyPokemonList[index].name,
            type: dummyPokemonList[index].type,
          );
        },
      ),
    );
  }
}
