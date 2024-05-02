import 'package:flutter/material.dart';

class Pallete {
  static const Map<String, Color> typeColor = {
    'normal': Color(0xffAAA67F),
    'rock': Color(0xffB69E31),
    'ghost': Color(0xff70559B),
    'steel': Color(0xffB7B9D0),
    'water': Color(0xff6493EB),
    'grass': Color(0xff74CB48),
    'psychic': Color(0xffFB5584),
    'ice': Color(0xff9AD6DF),
    'dark': Color(0xff75574C),
    'fairy': Color(0xffE69EAC),
    'fighting': Color(0xffC12239),
    'flying': Color(0xffA891EC),
    'poison': Color(0xffA43E9E),
    'ground': Color(0xffDEC16B),
    'fire': Color(0xffF57D31),
    'bug': Color(0xffA7B723),
    'electric': Color(0xffF9CF30),
    'dragon': Color(0xff7037FF),
  };

  static Color getColor(String type) {
    return typeColor[type] ?? const Color(0xffAAA67F);
  }

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color backgroundColor = Color(0xffF7F7F7);
  static const Color secondaryColor = Color(0xffEC0344);
  static const Color cyanColor = Color(0xffBDBDBD);
}
