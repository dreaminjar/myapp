import 'package:myapp/models/user.dart';

class AuthService {
  static Future<User?> login(String id, String password) async {
    // Admin kullanıcı doğrulaması
    if (id == 'admin' && password == 'adminpassword') {
      return User(id: 'admin', name: 'Admin User', isAdmin: true);
    }

    // Normal kullanıcı doğrulaması
    if (id == '123' && password == 'password') {
      return User(id: '123', name: 'John Doe', isAdmin: false);
    }

    // Yanlış kimlik bilgileri
    return null;
  }
}