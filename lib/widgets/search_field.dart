import '../theme/pallete.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  TextEditingController controller;

  SearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'Buscar',
          labelStyle: const TextStyle(
            color: Pallete.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentPadding:
              const EdgeInsets.only(left: 20, top: 16, bottom: 16, right: 10),
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
          suffixIcon: controller.text.isEmpty
              ? const Icon(Icons.search, color: Pallete.secondaryColor)
              : IconButton(
                  icon: const Icon(Icons.clear, color: Pallete.secondaryColor),
                  onPressed: () {
                    controller.clear();
                    (context as Element).markNeedsBuild();
                  },
                ),
        ),
        onChanged: (value) {
          (context as Element).markNeedsBuild();
        },
      ),
    );
  }
}
