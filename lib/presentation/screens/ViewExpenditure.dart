/*Ver gastos*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import '../widget/Drawer.dart';

class Viewexpenditure extends StatefulWidget {
  const Viewexpenditure({super.key});

  @override
  State<Viewexpenditure> createState() => _ViewexpenditureState();
}

class _ViewexpenditureState extends State<Viewexpenditure> {
  final List<String> _categories = [
    'Alimentacion',
    'Transporte',
    'Entretenimiento',
    'Vicios'
  ];
  String? _selectedCategory;
  final TextEditingController _amountController =
      TextEditingController(text: '\$350');
  TextEditingController _descriptionController =
      TextEditingController(text: 'Johnny Walker Blue Label');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gasto en guaro'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Fecha: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                  style: const TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Monto',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Categoría',
                  ),
                  value: _selectedCategory,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripción',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toastification.show(
                            style: ToastificationStyle.minimal,
                            primaryColor: Colors.green,
                            type: ToastificationType.success,
                            context: context,
                            title: const Text('Gasto actualizado'),
                            autoCloseDuration: const Duration(seconds: 3),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Actualizar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          toastification.show(
                            style: ToastificationStyle.minimal,
                            primaryColor: Colors.redAccent,
                            // Use a softer red color
                            type: ToastificationType.success,
                            context: context,
                            title: const Text('Gasto eliminado'),
                            autoCloseDuration: const Duration(seconds: 3),
                          );
                          Navigator.pop(context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Eliminar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
