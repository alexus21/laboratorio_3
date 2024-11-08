import 'package:flutter/material.dart';
import '../widget/Drawer.dart';

class Newexpenditure extends StatefulWidget {
  const Newexpenditure({super.key});

  @override
  State<Newexpenditure> createState() => _NewexpenditureState();
}

class _NewexpenditureState extends State<Newexpenditure> {
  final List<String> _categories = ['Alimentacion', 'Transporte', 'Entretenimiento', 'Vicios'];
  String? _selectedCategory;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
  }

  void validateFields() {
    String amount = _amountController.text;
    String description = _descriptionController.text;

    if (amount.isEmpty) {
      _showErrorDialog('El monto no puede estar vacío.');
      return;
    }

    if (double.parse(amount) < 0) {
      _showErrorDialog('El monto no puede ser menor que 0.');
      return;
    }

    if(_selectedCategory == null) {
      _showErrorDialog('Debe seleccionar una categoría.');
      return;
    }

    if(description.isEmpty) {
      _showErrorDialog('La descripción no puede estar vacía.');
      return;
    }

    if(description.length < 5) {
      _showErrorDialog('La descripción debe tener al menos 5 caracteres.');
      return;
    }

    Navigator.pop(context);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo gasto'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Text('Ingrese los datos del gasto', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 50),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Monto',
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
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
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descripción',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fecha',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    validateFields();
                  });
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}