import 'package:myapp/models/field.dart';
import 'package:myapp/models/user.dart';

class DataService {
  static final List<User> _users = [
    User(id: '123', name: 'John Doe', isAdmin: false),
  ];
  static final Map<String, String> _passwords = {
    '123': 'password',
  };
  static final Map<String, List<Field>> _userFields = {
    '123': [
      Field(
        id: '1',
        name: 'Tarla 1',
        variety: 'Variety 1',
        plantingDate: '2022-03-15',
        area: 10.5,
        tasselCutDate: '2022-07-15',
        sprayingDate: '2022-05-15',
      ),
      Field(
        id: '2',
        name: 'Tarla 2',
        variety: 'Variety 2',
        plantingDate: '2022-04-01',
        area: 20.0,
        tasselCutDate: '2022-08-01',
        sprayingDate: '2022-06-01',
      ),
    ],
  };

  static Future<User> login(String id, String password) async {
    final user = _users.firstWhere((user) => user.id == id, orElse: () {
      throw Exception('User not found');
    });
    if (_passwords[id] == password) {
      return user;
    }
    throw Exception('Invalid password');
  }

  static Future<List<Field>> getFieldsForUser(String userId) async {
    return _userFields[userId] ?? [];
  }

  static void addUser(User user, String password) {
    _users.add(user);
    _passwords[user.id] = password;
    _userFields[user.id] = [];
  }

  static void addFieldToUser(String userId, Field field) {
    _userFields[userId]?.add(field);
  }

  static void addFieldRecord(String fieldId, String record) {
    // Bu bölümde veri kaynağına kayıt eklemelisiniz
    // Örnek olarak, bu işlem burada loglanıyor
    print('Record added to field $fieldId: $record');
  }
}