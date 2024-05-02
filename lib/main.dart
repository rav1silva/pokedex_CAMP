import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Pallete.secondaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

