import 'package:http/http.dart' as http;
import 'package:pokemonapp/model/pokemon.dart';

class PokemonService {
  final String baseUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Future<PokemonResponseModel> getAllPokemon() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final pokemonResponse = PokemonResponseModel.fromJson(response.body);
      return pokemonResponse;
    } else {
      throw Exception("Vailed to load.");
    }
  }
}
