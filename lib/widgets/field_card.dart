import 'package:flutter/material.dart';
import 'package:myapp/models/field.dart';

class FieldCard extends StatelessWidget {
  final Field field;
  final VoidCallback onTap;

  FieldCard({required this.field, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(field.name),
        subtitle: Text('Ekim Tarihi: ${field.plantingDate}'),
        onTap: onTap,
      ),
    );
  }
}