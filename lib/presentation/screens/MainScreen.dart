import 'package:flutter/material.dart';

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
            const Text("Filtrar por:", style: TextStyle(fontSize: 20)),
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
    final List<String> categories = ['Alimentacion', 'Transporte', 'Entretenimiento', 'Vicios'];
    final List<String> fechas = ['09/11/2001', '03/05/2003', '30/03/1850', '01/09/1939'];

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
                //
              });
            },
          ),
          const SizedBox(height: 20),
        ],
      );
    } else {
      return DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Fechas',
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
            //
          });
        },
      );
    }
  }
}
