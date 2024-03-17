import 'package:area_calc/UI/components/base_scaffold.dart';
import 'package:area_calc/UI/components/input_field.dart';
import 'package:area_calc/UI/components/main_button.dart';
import 'package:area_calc/UI/components/result_dialog.dart';
import 'package:area_calc/UI/components/shape_selection_button.dart';
import 'package:area_calc/UI/components/triangle.dart';
import 'package:area_calc/utils.dart';
import 'package:flutter/material.dart';

class CalcTrianglePage extends StatefulWidget {
  const CalcTrianglePage({super.key});

  @override
  State<CalcTrianglePage> createState() => _CalcTrianglePageState();
}

class _CalcTrianglePageState extends State<CalcTrianglePage> {
  final TextEditingController b = TextEditingController();
  final TextEditingController h = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      final res =
          calculateTriangleArea(double.parse(b.text), double.parse(h.text));
      showDialog(
          context: context,
          builder: (context) {
            return ResultDialog(result: res);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        isAppBarEnabled: true,
        title: "Luas Segitiga",
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ShapeSelectionButton(
                  foregroundPainter: TrianglePainter(),
                  buttonText: "Segitiga",
                  onPressed: () {},
                ),
                const SizedBox(height: 100),
                InputField(labelText: "Masukan Nilai Alas", controller: b),
                const SizedBox(height: 50),
                InputField(labelText: "Masukan Nilai Tinggi", controller: h),
                const SizedBox(height: 50),
                MainButton(
                  text: "Hitung Luas",
                  onPressed: () {
                    validateForm();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
