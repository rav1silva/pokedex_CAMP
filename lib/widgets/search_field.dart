import '../theme/pallete.dart';
import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  TextEditingController controller;
  SearchField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 303),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.secondaryColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.secondaryColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Buscar pokemon',
        ),
      ),
    );
  }
}
