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
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color(0xFF00478B)),
              ),
              const Divider(
                thickness: 2.0,
              ),
              const Text(
                "Apakah anda ingin menghitung luas lagi?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size(100, double.infinity)),
                    child: const Text("Ya"),
                  ),
                  OutlinedButton(
                      onPressed: () {
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
