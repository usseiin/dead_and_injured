import 'package:dead_and_injured/data/app_data.dart';
import 'package:dead_and_injured/main.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datas = appDataBox.getAll();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            final data = AppData.fromAppDataLocal(datas[index]);
            return ListTile(
              title: Text(data.generatedValue),
              subtitle: Text("diff: ${data.difficulty.name}"),
              leading: Text("${data.result.length}"),
            );
          },
        ),
      ),
    );
  }
}
