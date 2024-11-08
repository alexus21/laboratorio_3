/*Ver gastos*/

import 'package:flutter/material.dart';

import '../widget/Drawer.dart';

class Viewexpenditure extends StatefulWidget {
  const Viewexpenditure({super.key});

  @override
  State<Viewexpenditure> createState() => _ViewexpenditureState();
}

class _ViewexpenditureState extends State<Viewexpenditure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gasto en guaro'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Monto: US \$1000'),
            Text('Categoría: alimentación'),
            Text('Descripción: Eva María se fue a la playa'),
          ],
        ),
      ),
    );
  }
}

