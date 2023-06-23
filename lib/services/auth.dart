import 'package:hive/hive.dart';
import 'package:todo_bloc/model/user.dart';

class AuthService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>("usersBox");

    await _users.add(User("test", "test"));
  }

  Future<String?> authUser(final String username, final String password) async {
    final success = _users.values.any((element) => element.username == username && element.password == password);
    return success ? username : null;
  }

  Future<UserCreationResult> createUser(final String username, final String password) async {
    final exist = await _users.values.any((element) => element.username.toLowerCase() == username.toLowerCase());

    if (exist) {
      return UserCreationResult.exist;
    }

    try {
      await _users.add(User(username, password));
      return UserCreationResult.success;
    } catch (ex) {
      return UserCreationResult.failure;
    }
  }
}

enum UserCreationResult { success, failure, exist }
