class User {
  final String id;
  final String name;
  final bool isAdmin;

  User({required this.id, required this.name, required this.isAdmin});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      isAdmin: json['isAdmin'] ?? false,
    );
  }
}