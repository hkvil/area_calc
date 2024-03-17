import 'package:area_calc/UI/components/base_scaffold.dart';
import 'package:area_calc/UI/components/circle.dart';
import 'package:area_calc/UI/components/input_field.dart';
import 'package:area_calc/UI/components/main_button.dart';
import 'package:area_calc/UI/components/result_dialog.dart';
import 'package:area_calc/UI/components/shape_selection_button.dart';
import 'package:area_calc/utils.dart';
import 'package:flutter/material.dart';

class CalcCirclePage extends StatefulWidget {
  const CalcCirclePage({super.key});

  @override
  State<CalcCirclePage> createState() => _CalcCirclePageState();
}

class _CalcCirclePageState extends State<CalcCirclePage> {
  final TextEditingController r = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      final res = calculateCircleArea(double.parse(r.text));
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
        title: "Luas Lingkaran",
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ShapeSelectionButton(
                  foregroundPainter: CirclePainter(),
                  buttonText: "Lingkaran",
                  onPressed: () {},
                ),
                const SizedBox(height: 100),
                InputField(labelText: "Masukan Nilai Jari-Jari", controller: r),
                const SizedBox(height: 100),
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
