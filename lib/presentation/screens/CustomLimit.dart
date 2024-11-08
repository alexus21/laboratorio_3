import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../widget/Drawer.dart';
import 'Home.dart';

class Customlimit extends StatefulWidget {
  const Customlimit({super.key});

  @override
  State<Customlimit> createState() => _CustomlimitState();
}

class _CustomlimitState extends State<Customlimit> {
  final TextEditingController _customLimitController = TextEditingController(text: '350');

  @override
  void dispose() {
    super.dispose();
    _customLimitController.dispose();
  }

  void validateFields() {
    String myLimit = _customLimitController.text;

    if (myLimit.isEmpty) {
      _showErrorDialog('El monto no puede estar vacío.');
      return;
    }

    if (double.parse(myLimit) < 0) {
      _showErrorDialog('El monto no puede ser menor que 0.');
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
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
        title: const Text('Límite de Gastos'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Text('Ingrese el límite deseado',
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 50),
              TextField(
                controller: _customLimitController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Monto',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: validateFields,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}