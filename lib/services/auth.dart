import 'package:hive/hive.dart';
import 'package:todo_bloc/model/user.dart';

class Auth {
  late Box<User> _users;

  Future init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>("usersBox");
  }

  Future<String?> authUser(final String username, final String password) async {
    final success = _users.values.any((element) =>
        element.username == username && element.password == password);
    return success ? username : null;
  }
}
