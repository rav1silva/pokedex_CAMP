import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_ravi/theme/font.dart';
import 'package:pokedex_ravi/theme/pallete.dart';
import 'package:pokedex_ravi/widgets/not_found.dart';
import 'dart:convert';
import 'package:pokedex_ravi/widgets/switch_mode.dart';

import 'package:pokedex_ravi/widgets/search_field.dart';

import '../widgets/card_pokemon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pokemonsInit = [];
  List pokemonsDetails = [];
  List pokemonsFixed = [];
  bool loading = true;
  bool nothingFound = false;
  final controllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPokemons();
    controllerSearch.addListener(searchPokemon);
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }

  fetchPokemons() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      pokemonsInit = decodedJson['results'];

      var futures = <Future>[];
      for (var pokemon in pokemonsInit) {
        futures.add(fetchPokemonType(pokemon['name']));
      }

      var types = await Future.wait(futures);

      for (int i = 0; i < pokemonsInit.length; i++) {
        var pokemon = pokemonsInit[i];
        String type = types[i];

        String numberFormat = '#${(i + 1).toString().padLeft(3, '0')}';

        var poke = {
          'name': pokemon['name'],
          'number': numberFormat,
          'image':
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${i + 1}.png',
          'type': type
        };

        pokemonsDetails.add(poke);
        pokemonsFixed.add(poke);
      }

      setState(() {});
      loading = false;
    } else {
      throw Exception('Failed to load Pokemons');
    }
  }

  Future<String> fetchPokemonType(String pokemonName) async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      return decodedJson['types'][0]['type']['name'];
    } else {
      return 'normal';
    }
  }

  void searchPokemon() {
    String searchText = controllerSearch.text.toLowerCase();

    if (searchText.isEmpty) {
      setState(() {
        pokemonsDetails = pokemonsFixed;
        nothingFound = false;

      });
    } else {
      List filteredPokemons = pokemonsDetails.where((pokemon) {
        String pokemonName = pokemon['name'].toLowerCase();
        return pokemonName.contains(searchText);
      }).toList();

      if (filteredPokemons.isEmpty) {
        setState(() {
          nothingFound = true;
        });
      } else {
        setState(() {
          nothingFound = false;
          pokemonsDetails = filteredPokemons;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 67),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/img/logo.svg',
                  semanticsLabel: 'Logo',
                  height: 32,
                  width: 24,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'ioasys pokédex',
                    style: TextStyle(
                      fontSize: Font.size24,
                      fontFamily: Font.poppins,
                      fontWeight: FontWeight.bold,
                      color: Pallete.secondaryColor,
                    ),
                  ),
                ),
                const Spacer(),
                SwitchMode(),
              ],
            ),
            const SizedBox(height: 31),
            Row(
              children: [
                SearchField(controller: controllerSearch),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: const Icon(Icons.favorite,
                        color: Pallete.secondaryColor),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: loading,
              child: const Expanded(
                  child: Center(child: CircularProgressIndicator())),
            ),
            Visibility(
              visible: !loading,
              child: Expanded(
                child: nothingFound
                    ? const ShowNotFound()
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3.0,
                        ),
                        itemCount: pokemonsDetails.length,
                        itemBuilder: (context, index) {
                          return CardPokemon(
                            pokemonName: pokemonsDetails[index]['name'],
                            pokemonNumber: pokemonsDetails[index]['number'],
                            pokemonType: pokemonsDetails[index]['type'],
                            pokemonImage: pokemonsDetails[index]['image'],
                          );
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 28,
              child: Center(
                child: Icon(
                  Icons.swipe_down,
                  color: Pallete.secondaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
