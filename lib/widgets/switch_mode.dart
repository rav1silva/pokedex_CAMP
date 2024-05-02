import 'package:flutter/material.dart';
import 'package:pokedex_ravi/theme/pallete.dart';

class SwitchMode extends StatefulWidget {
  bool dark;

  SwitchMode({super.key, this.dark = false});

  @override
  State<SwitchMode> createState() => _SwitchModeState();
}

class _SwitchModeState extends State<SwitchMode> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.dark,
      activeColor: Pallete.secondaryColor,
      onChanged: (bool value) {
        setState(() {
          widget.dark = value;
        });
      },
    );
  }
}
