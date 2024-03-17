import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, required this.onPressed});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            fixedSize: const Size(200, 60)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ));
  }
}
