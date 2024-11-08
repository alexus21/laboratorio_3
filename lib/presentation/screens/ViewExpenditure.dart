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
  final TextEditingController _amountController = TextEditingController(text: '\$350');
  final TextEditingController _descriptionController = TextEditingController(text: 'Johnny Walker Blue Label');
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    super.dispose();
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

    if (_selectedCategory == null) {
      _showErrorDialog('Debe seleccionar una categoría.');
      return;
    }

    if (description.isEmpty) {
      _showErrorDialog('La descripción no puede estar vacía.');
      return;
    }

    if (description.length < 5) {
      _showErrorDialog('La descripción debe tener al menos 5 caracteres.');
      return;
    }

    DateTime now = DateTime.now();
    DateTime date = DateFormat('dd/MM/yyyy').parse(_dateController.text);
    if (date.isAfter(now)) {
      _showErrorDialog('La fecha no puede ser futura.');
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripción',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fecha',
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dateController.text =
                            DateFormat('dd/MM/yyyy').format(pickedDate);
                      });
                    }
                  },
                  controller: _dateController,
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
                          validateFields();
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