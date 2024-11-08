import 'package:flutter/material.dart';
import '../screens/ViewExpenditure.dart';

class ExpenditureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ExpenditureCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: const Icon(Icons.money),
          trailing: const Icon(Icons.delete),
        ),
      ),
    );
  }
}

ListView buildListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ExpenditureCard(
        title: 'Gasto 1',
        subtitle: 'Descripcion del gasto 1',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Viewexpenditure()));
        },
      ),
      ExpenditureCard(
        title: 'Gasto 2',
        subtitle: 'Descripcion del gasto 2',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Viewexpenditure()));
        },
      ),
      ExpenditureCard(
        title: 'Gasto 3',
        subtitle: 'Descripcion del gasto 3',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Viewexpenditure()));
        },
      ),
    ],
  );
}