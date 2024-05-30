import 'package:flutter/material.dart';
import 'package:myapp/models/field.dart';
import 'package:myapp/services/data_service.dart';

class RecordEntryScreen extends StatefulWidget {
  final Field field;

  RecordEntryScreen({required this.field});

  @override
  _RecordEntryScreenState createState() => _RecordEntryScreenState();
}

class _RecordEntryScreenState extends State<RecordEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _recordController = TextEditingController();

  @override
  void dispose() {
    _recordController.dispose();
    super.dispose();
  }

  void _submitRecord() {
    if (_formKey.currentState!.validate()) {
      DataService.addFieldRecord(widget.field.id, _recordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Record added')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Record'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _recordController,
                decoration: InputDecoration(labelText: 'Record'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a record';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitRecord,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
