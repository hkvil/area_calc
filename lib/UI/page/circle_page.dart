import 'package:area_calc/UI/components/base_scaffold.dart';
import 'package:area_calc/UI/components/circle.dart';
import 'package:area_calc/UI/components/input_field.dart';
import 'package:area_calc/UI/components/main_button.dart';
import 'package:area_calc/UI/components/result_dialog.dart';
import 'package:area_calc/UI/components/shape_selection_button.dart';
import 'package:area_calc/provider/database_provider.dart';
import 'package:area_calc/provider/navigation_index_provider.dart';
import 'package:area_calc/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      Provider.of<DatabaseProvider>(context, listen: false)
          .insertCircle(double.parse(r.text), double.parse(res));
      showDialog(
          context: context,
          builder: (context) {
            return ResultDialog(result: res);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<NavigationIndexProvider>(context, listen: false).selectedIndex =
        0;
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
