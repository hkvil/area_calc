import 'package:area_calc/UI/components/base_scaffold.dart';
import 'package:area_calc/UI/components/circle.dart';
import 'package:area_calc/UI/components/shape_selection_button.dart';
import 'package:area_calc/UI/components/triangle.dart';
import 'package:area_calc/constant.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        isAppBarEnabled: false,
        title: "",
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextShapeSelection,
                const SizedBox(height: 30.0),
                ShapeSelectionButton(
                  foregroundPainter: TrianglePainter(),
                  buttonText: "Segitiga",
                  onPressed: () {
                    Navigator.pushNamed(context, '/triangle');
                  },
                ),
                const SizedBox(height: 30.0),
                ShapeSelectionButton(
                  foregroundPainter: CirclePainter(),
                  buttonText: "Lingkaran",
                  onPressed: () {
                    Navigator.pushNamed(context, '/circle');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
