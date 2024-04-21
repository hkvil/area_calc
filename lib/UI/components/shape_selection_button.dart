import 'package:flutter/material.dart';

class ShapeSelectionButton extends StatelessWidget {
  const ShapeSelectionButton(
      {super.key,
      required this.foregroundPainter,
      required this.buttonText,
      required this.onPressed});

  final CustomPainter foregroundPainter;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(shape: const BeveledRectangleBorder()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomPaint(
              size: const Size(200, 200),
              foregroundPainter: foregroundPainter,
            ),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
