import 'package:flutter/material.dart';
import 'package:myapp/services/data_service.dart';
import 'package:myapp/models/field.dart';
import 'package:myapp/models/user.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fieldNameController = TextEditingController();
  final TextEditingController _varietyController = TextEditingController();
  final TextEditingController _plantingDateController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _tasselCutDateController = TextEditingController();
  final TextEditingController _sprayingDateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Yeni Kullanıcı Ekle', style: TextStyle(fontSize: 18)),
              TextField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'Kullanıcı ID'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Şifre'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  DataService.addUser(User(id: _idController.text, name: '', isAdmin: false), _passwordController.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Kullanıcı eklendi')));
                },
                child: Text('Kullanıcı Ekle'),
              ),
              Divider(),
              Text('Yeni Tarla Ekle', style: TextStyle(fontSize: 18)),
              TextField(
                controller: _fieldNameController,
                decoration: InputDecoration(labelText: 'Tarla İsmi'),
              ),
              TextField(
                controller: _varietyController,
                decoration: InputDecoration(labelText: 'Çeşit Katsayısı'),
              ),
              TextField(
                controller: _plantingDateController,
                decoration: InputDecoration(labelText: 'Ekim Tarihi'),
              ),
              TextField(
                controller: _areaController,
                decoration: InputDecoration(labelText: 'Tarla Alanı'),
              ),
              TextField(
                controller: _tasselCutDateController,
                decoration: InputDecoration(labelText: 'Püskül Kesim Tarihi'),
              ),
              TextField(
                controller: _sprayingDateController,
                decoration: InputDecoration(labelText: 'İlaçlama Tarihi'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Field newField = Field(
                    id: DateTime.now().toString(),
                    name: _fieldNameController.text,
                    variety: _varietyController.text,
                    plantingDate: _plantingDateController.text,
                    area: double.tryParse(_areaController.text) ?? 0,
                    tasselCutDate: _tasselCutDateController.text,
                    sprayingDate: _sprayingDateController.text,
                  );
                  DataService.addFieldToUser(_idController.text, newField);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tarla eklendi')));
                },
                child: Text('Tarla Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}