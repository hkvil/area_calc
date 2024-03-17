import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      required this.isAppBarEnabled,
      required this.title,
      required this.body});

  final bool isAppBarEnabled;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
