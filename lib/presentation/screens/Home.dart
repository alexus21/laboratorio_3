import 'package:flutter/material.dart';
import 'package:laboratorio_3/presentation/screens/MainScreen.dart';

import '../Handler/ConnectionHandler.dart';
import '../widget/Drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      body: const Mainscreen(),
    );
  }
}
