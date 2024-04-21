import 'dart:math';

import 'package:area_calc/UI/components/circle.dart';
import 'package:area_calc/UI/components/triangle.dart';
import 'package:area_calc/model/shape.dart';
import 'package:flutter/material.dart';

String calculateCircleArea(double r) {
  double area = pi * r * r;
  return area.toStringAsFixed(2);
}

String calculateTriangleArea(double base, double height) {
  double area = 0.5 * base * height;
  return area.toStringAsFixed(2);
}

Widget getShapeIcon(String type) {
  switch (type) {
    case "circle":
      return CustomPaint(
        size: const Size(24, 24),
        foregroundPainter: CirclePainter(),
      );
    case "triangle":
      return CustomPaint(
        size: const Size(24, 24),
        foregroundPainter: TrianglePainter(),
      );
    default:
      return const Icon(Icons.error);
  }
}

String getShapeSubtitle(Shape shape) {
  switch (shape.type) {
    case "circle":
      return "Jari-jari:${shape.dimension1.toString()}";
    case "triangle":
      return "Alas:${shape.dimension1.toString()} Tinggi:${shape.dimension2.toString()}";
    default:
      return "Error";
  }
}
