import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key, required this.labelText, required this.controller});
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please input a number';
          } else if (double.tryParse(value) == null) {
            return 'Please input a valid number';
          }
          return null;
        },
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: labelText,
            labelText: labelText),
      ),
    );
  }
}
