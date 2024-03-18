import 'package:area_calc/UI/page/circle_page.dart';
import 'package:area_calc/UI/page/home_page.dart';
import 'package:area_calc/UI/page/selection_page.dart';
import 'package:area_calc/UI/page/triangle_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) => MaterialApp(
        title: 'AreaCalc',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/triangle': (context) => const CalcTrianglePage(),
          '/circle': (context) => const CalcCirclePage(),
          '/select': (context) => const SelectionPage()
        },
      ),
      maximumSize: const Size(475.0, 812.0),
    );
  }
}
