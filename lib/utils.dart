import 'dart:math';

String calculateCircleArea(double r) {
  double area = pi * r * r;
  return area.toStringAsFixed(2);
}

String calculateTriangleArea(double base, double height) {
  double area = 0.5 * base * height;
  return area.toStringAsFixed(2);
}
