import 'package:flutter/material.dart';

import '../widget/Drawer.dart';
import '../widget/ListView.dart';

class Expanditurepreviousmonths extends StatefulWidget {
  const Expanditurepreviousmonths({super.key});

  @override
  State<Expanditurepreviousmonths> createState() => _ExpanditurepreviousmonthsState();
}

class _ExpanditurepreviousmonthsState extends State<Expanditurepreviousmonths> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos de meses anteriores'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: buildListView(context),
            ),
          ],
        ),
      ),
    );
  }
}
