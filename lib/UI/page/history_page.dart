import 'package:area_calc/UI/components/base_scaffold.dart';
import 'package:area_calc/model/shape.dart';
import 'package:area_calc/provider/database_provider.dart';
import 'package:area_calc/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        isAppBarEnabled: true,
        title: "History",
        body: FutureBuilder<List<Shape>>(
            future: Provider.of<DatabaseProvider>(context).getHistory(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      Shape shape = snapshot.data![index];
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: getShapeIcon(shape.type),
                              title: Text(shape.area.toString()),
                              subtitle: Text(getShapeSubtitle(shape)),
                            )
                          ],
                        ),
                      );
                    });
              }
            })));
  }
}
