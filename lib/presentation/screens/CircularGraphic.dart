import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widget/Drawer.dart';

class Circulargraphic extends StatefulWidget {
  const Circulargraphic({super.key});

  @override
  State<Circulargraphic> createState() => _CirculargraphicState();
}

class _CirculargraphicState extends State<Circulargraphic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico Circular'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Gráfico circular de tus gastos según categorías',
                style: TextStyle(fontSize: 20)),
            PieChart(
              dataMap: {
                'Alimentacion': 5,
                'Transporte': 3,
                'Entretenimiento': 2,
                'Vicios': 2,
              },
              chartType: ChartType.ring,
              chartRadius: 200,
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
