import 'dart:io';
import 'package:area_calc/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key, required this.result});
  final String result;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                result,
                style: resultTextStyle,
              ),
              const Divider(
                thickness: 2.0,
              ),
              const Text(
                "Apakah anda ingin menghitung luas lagi?",
                textAlign: TextAlign.center,
                style: resultConfirmationTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/select');
                    },
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size(100, double.infinity)),
                    child: const Text("Ya"),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (Platform.isWindows) {
                          exit(0);
                        }
                        SystemNavigator.pop();
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          fixedSize: const Size(100, double.infinity)),
                      child: const Text("Tidak"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
