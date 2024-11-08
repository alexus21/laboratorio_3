import 'package:flutter/material.dart';

import '../widget/Drawer.dart';
import '../widget/ListView.dart';

class Expanditurereport extends StatefulWidget {
  const Expanditurereport({super.key});

  @override
  State<Expanditurereport> createState() => _ExpanditurereportState();
}

class _ExpanditurereportState extends State<Expanditurereport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de gastos del mes'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Gastos de noviembre', style: TextStyle(fontSize: 20)),
            Expanded(
              child: buildListView(context),
            ),
          ],
        ),
      ),
    );
  }
}
