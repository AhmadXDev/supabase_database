import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final double radiusCircular;

  const TextInput(
      {super.key,
      required this.controller,
      required this.labelText,
      this.radiusCircular = 16.0});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
        ),
      ),
    );
  }
}
