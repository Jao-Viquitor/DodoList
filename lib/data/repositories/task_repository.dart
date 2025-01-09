import 'package:dodo/data/models/task_model.dart';
import 'package:hive/hive.dart';

class TaskRepository {
  static const String _boxName = 'tasks';

  Future<void> addTask(TaskModel task) async {
    final box = await Hive.openBox<TaskModel>(_boxName);
    await box.add(task);
  }

  Future<List<TaskModel>> getTasks() async {
    final box = await Hive.openBox<TaskModel>(_boxName);
    return box.values.toList();
  }

  Future<void> deleteTask(int index) async {
    final box = await Hive.openBox<TaskModel>(_boxName);
    await box.deleteAt(index);
  }

  Future<void> clearTasks() async {
    final box = await Hive.openBox<TaskModel>(_boxName);
    await box.clear();
  }

  Future<List<TaskModel>> searchTasks(String query) async {
    final box = await Hive.openBox<TaskModel>(_boxName);
    return box.values
        .where((task) => task.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> completeTask(int index, bool isCompleted) async {
    final box = await Hive.openBox<TaskModel>(_boxName);
    final task = box.getAt(index);

    if (task != null) {
      final updatedTask = TaskModel(
        title: task.title,
        description: task.description,
        isCompleted: isCompleted,
      );
      await box.putAt(index, updatedTask);
    }
  }
}
