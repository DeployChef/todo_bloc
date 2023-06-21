import 'package:hive/hive.dart';
import 'package:todo_bloc/model/task.dart';

class TodoService {
  late Box<Task> _tasks;

  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _tasks = await Hive.openBox<Task>("tasksBox");
  }

  Future<List<Task>> getTasks(final String user) async {
    final tasks = _tasks.values.where((element) => element.user == user).toList();
    return tasks;
  }

  Future addTask(final String task, final String user) async {
    await _tasks.add(Task(user, task, false));
  }

  Future removeTask(final String task, final String user) async {
    final taskToRemove = _tasks.values.firstWhere((element) => element.task == task && element.user == user);
    await _tasks.delete(taskToRemove);
  }
}
