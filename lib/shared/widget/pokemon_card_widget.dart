import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String type;
  final VoidCallback onTap;

  const PokemonCardWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: type == "Grass"
              ? Colors.greenAccent
              : type == "Fire"
              ? Colors.redAccent
              : Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(imageUrl, fit: BoxFit.fill, width: double.infinity),
            Text(name),
            Text(type),
          ],
        ),
      ),
    );
  }
}
