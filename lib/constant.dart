import 'package:flutter/material.dart';

const homeTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Color(0xFF00478B),
  fontSize: 40,
);

const bold = TextStyle(fontWeight: FontWeight.bold);
const TextSolusi = Text.rich(
  textAlign: TextAlign.center,
  TextSpan(
    style: TextStyle(
      fontSize: 16,
    ),
    children: [
      TextSpan(text: "Solusi Terbaik ", style: bold),
      TextSpan(text: "untuk "),
      TextSpan(text: "Menghitung Luas Segitiga ", style: bold),
      TextSpan(text: "dan "),
      TextSpan(text: "Lingkaran ", style: bold),
      TextSpan(text: "Secara "),
      TextSpan(text: "Cepat ", style: bold),
      TextSpan(text: "dan "),
      TextSpan(text: "Akurat! ", style: bold),
    ],
  ),
);

const TextShapeSelection = Text.rich(
    textAlign: TextAlign.center,
    maxLines: 2,
    TextSpan(style: TextStyle(fontSize: 20), children: [
      TextSpan(text: "Luas "),
      TextSpan(text: "Bangun Datar ", style: bold),
      TextSpan(text: "apa yang ingin kamu hitung?")
    ]));
