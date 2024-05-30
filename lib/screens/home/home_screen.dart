import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/models/field.dart';
import 'package:myapp/screens/field_details_screen.dart';
import 'package:myapp/services/data_service.dart';
import 'package:myapp/widgets/field_card.dart';
import 'package:myapp/screens/admin/admin_screen.dart';
import 'package:myapp/screens/auth/login_screen.dart'; // Çıkış yapma ekranı için import ekleyin

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          if (user.isAdmin)
            IconButton(
              icon: Icon(Icons.admin_panel_settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminScreen()),
                );
              },
            ),
          IconButton( // Çıkış yapma butonunu ekleyin
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Field>>(
        future: DataService.getFieldsForUser(user.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final fields = snapshot.data!;
            return ListView.builder(
              itemCount: fields.length,
              itemBuilder: (context, index) {
                final field = fields[index];
                return FieldCard(field: field, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FieldDetailsScreen(field: field)),
                  );
                });
              },
            );
          }
        },
      ),
    );
  }
}
