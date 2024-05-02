import 'package:flutter/material.dart';

import '../theme/font.dart';
import '../theme/pallete.dart';

class ShowNotFound extends StatelessWidget {
  const ShowNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Ops',
          style: TextStyle(
            fontSize: 148,
            fontWeight: FontWeight.bold,
            color: Pallete.cyanColor,
            fontFamily: Font.poppins,
          ),
        ),
        Text(
          'Este pokemon não está aqui ;(',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Pallete.cyanColor,
            fontFamily: Font.poppins,
          ),
        ),
      ],
    );
  }
}
