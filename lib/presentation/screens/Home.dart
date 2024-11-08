import 'package:flutter/material.dart';
import 'package:laboratorio_3/presentation/screens/MainScreen.dart';
import 'package:laboratorio_3/presentation/screens/NewExpenditure.dart';

import '../widget/Drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: const Mainscreen(),
    );
  }
}