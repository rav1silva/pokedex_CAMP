import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../theme/pallete.dart';
import '../widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pokemons = [];
  TextEditingController controllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPokemons();
  }

  fetchPokemons() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      setState(() {
        pokemons = decodedJson['results'];
      });
    } else {
      throw Exception('Failed to load Pokemons');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Pallete.backgroundColor,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 428,
              height: 17,
              color: Pallete.secondaryColor, // Cor da faixa
            ),
          ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/iconIoasys.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Ioasys Kanto Pokédex',
                      style: TextStyle(fontSize: 24, color: Pallete.secondaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      height: 54,
                      width: 303,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Pallete.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Pallete.secondaryColor),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.white,
                            child: Text(
                              'Buscar',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: controllerSearch,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Buscar Pokemon',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          
         /* Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding:const EdgeInsets.symmetric(horizontal:
              child: Image.asset('assets/images/lupa.png',
              height: 20,
              width 20,
              ))
            ),
          ),
        */
      
      

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        pokemons[index]['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
                
              },
            ),
          ),
        ],
      ),
      
    );
  }
}
