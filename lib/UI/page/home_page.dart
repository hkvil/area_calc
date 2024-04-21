import 'package:area_calc/UI/components/base_scaffold.dart';
import 'package:area_calc/UI/components/main_button.dart';
import 'package:area_calc/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        isAppBarEnabled: false,
        title: "",
        isBottomNavEnabled: false,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("images/Home.png"),
              const Text("AreaCalc", style: homeTitleStyle),
              const SizedBox(width: 270, child: TextSolusi),
              MainButton(
                text: "Mulai",
                onPressed: () {
                  Navigator.pushNamed(context, '/select');
                },
              ),
            ],
          ),
        ));
  }
}
