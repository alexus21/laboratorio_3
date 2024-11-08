import 'package:flutter/material.dart';
import 'package:laboratorio_3/presentation/Handler/ConnectionHandler.dart';

import '../widget/Drawer.dart';
import '../widget/ListView.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String? selectedFilter;
  Widget? widgetToShow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile<String>(
              title: const Text('Categoría'),
              value: "Categoria",
              groupValue: selectedFilter,
              onChanged: (String? value) {
                setState(() {
                  selectedFilter = value;
                  widgetToShow = showCategoriesFilter(value!);
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Fecha'),
              value: "Fecha",
              groupValue: selectedFilter,
              onChanged: (String? value) {
                setState(() {
                  selectedFilter = value;
                  widgetToShow = showCategoriesFilter(value!);
                });
              },
            ),
            if (widgetToShow != null) widgetToShow!,
            Expanded(
              child: buildListView(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: Colors.indigo,
          child: const Center(
            child: Text(
              'Total de gastos: US \$3000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showCategoriesFilter(String value) {
    final List<String> categories = [
      'Alimentacion',
      'Transporte',
      'Entretenimiento',
      'Vicios'
    ];
    final List<String> fechas = [
      '9/11/2001',
      '25/12/2000',
      '13/02/2001',
      '31/12/2001'
    ];

    if (value == "Categoria") {
      return Column(
        children: <Widget>[
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Categoría',
            ),
            value: null,
            items: categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                // Handle the new value if needed
              });
            },
          ),
          const SizedBox(height: 20),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fecha',
            ),
            value: null,
            items: fechas.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                // Handle the new value if needed
              });
            },
          ),
          const SizedBox(height: 20),
        ],
      );
    }
  }
}

connectDatabase() async {
  String host = "c9pv5s2sq0i76o.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com";

  final conn = DatabaseHandler(host: host, database: 'dc0qjd11dtes3o', username: 'u9fj19cl14b51r', password: 'pbc84b116581957c694c8e85642e9f65dabd651a4a8db3c4c2254b89328384007');
  await conn.connect();
  await conn.close();
}
