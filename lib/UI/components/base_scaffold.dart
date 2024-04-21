import 'package:area_calc/provider/navigation_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      required this.isAppBarEnabled,
      required this.title,
      required this.body,
      this.isBottomNavEnabled = true});

  final bool isAppBarEnabled;
  final bool isBottomNavEnabled;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationIndexProvider>(
        builder: (context, navigationIndexProvider, child) {
      return Scaffold(
        body: body,
        appBar: isAppBarEnabled
            ? AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                title: Text(title),
              )
            : const PreferredSize(
                preferredSize: Size.zero, child: SizedBox.shrink()),
        bottomNavigationBar: isBottomNavEnabled
            ? NavigationBar(
                onDestinationSelected: (int index) {
                  navigationIndexProvider.selectedIndex = index;
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, '/select');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/history');
                      break;
                  }
                },
                selectedIndex: navigationIndexProvider.selectedIndex,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.calculate),
                    label: "Calculate",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.history),
                    label: "History",
                  ),
                ],
              )
            : const PreferredSize(
                preferredSize: Size.zero, child: SizedBox.shrink()),
      );
    });
  }
}
