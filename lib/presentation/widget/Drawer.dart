import 'package:flutter/material.dart';
import 'package:laboratorio_3/presentation/screens/ExpanditurePreviousMonths.dart';
import 'package:laboratorio_3/presentation/screens/ExpanditureReport.dart';
import 'package:laboratorio_3/presentation/screens/MainScreen.dart';

import '../screens/NewExpenditure.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio'),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Mainscreen()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.money_off),
          title: const Text('Agregar un nuevo gasto'),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Newexpenditure()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.money_sharp),
          title: const Text('Reporte de gastos'),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Expanditurereport()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text('Reporte de gastos anteriores'),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Expanditurepreviousmonths()));
          },
        ),
      ],
    ),
  );
}