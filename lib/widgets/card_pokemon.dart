import 'package:flutter/material.dart';
import 'package:pokedex_ravi/theme/pallete.dart';

import '../theme/font.dart';

class CardPokemon extends StatelessWidget {
  String pokemonName;
  String pokemonType;
  String pokemonNumber;
  String pokemonImage;

  CardPokemon({
    super.key,
    required this.pokemonName,
    required this.pokemonType,
    required this.pokemonNumber,
    required this.pokemonImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Pallete.getColor(pokemonType),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 5),
                child: Text(
                  pokemonNumber,
                  style: TextStyle(
                      fontSize: Font.size8,
                      fontFamily: Font.poppins,
                      color: Pallete.getColor(pokemonType)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.network(
                  pokemonImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Pallete.getColor(pokemonType),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(5.0),
                  ),
                ),
                padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                child: Text(
                  pokemonName[0].toUpperCase() + pokemonName.substring(1),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: Font.size8,
                    fontFamily: Font.poppins,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
