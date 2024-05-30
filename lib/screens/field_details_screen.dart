import 'package:flutter/material.dart';
import 'package:myapp/models/field.dart';
import 'package:myapp/screens/record_entry_screen.dart';

class FieldDetailsScreen extends StatelessWidget {
  final Field field;

  FieldDetailsScreen({required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(field.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Çeşit Katsayısı: ${field.variety}', style: TextStyle(fontSize: 18)),
            Text('Ekim Tarihi: ${field.plantingDate}', style: TextStyle(fontSize: 18)),
            Text('Tarla Alanı: ${field.area}', style: TextStyle(fontSize: 18)),
            Text('Püskül Kesim Tarihi: ${field.tasselCutDate}', style: TextStyle(fontSize: 18)),
            Text('İlaçlama Tarihi: ${field.sprayingDate}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordEntryScreen(field: field)),
                );
              },
              child: Text('Kayıt Gir'),
            ),
          ],
        ),
      ),
    );
  }
}