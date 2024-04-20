import 'dart:math';
import 'package:area_calc/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Formula Area Calculation', () {
    test('Calculate Circle Area', () {
      double radius = 5;
      double expectedArea =
          double.parse((pi * radius * radius).toStringAsFixed(2));

      String result = calculateCircleArea(radius);
      double actualArea = double.parse(result);

      expect(actualArea, equals(expectedArea));
    });

    test('Calculate Triangle Area', () {
      double base = 4;
      double height = 6;
      double expectedArea =
          double.parse((0.5 * base * height).toStringAsFixed(2));

      String result = calculateTriangleArea(base, height);
      double actualArea = double.parse(result);

      expect(actualArea, equals(expectedArea));
    });
  });
}
