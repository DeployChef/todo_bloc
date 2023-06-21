import 'package:hive/hive.dart';
import 'package:todo_bloc/model/user.dart';

class AuthService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>("usersBox");
  }

  Future<String?> authUser(final String username, final String password) async {
    final success = _users.values.any((element) =>
        element.username == username && element.password == password);
    return success ? username : null;
  }
}
