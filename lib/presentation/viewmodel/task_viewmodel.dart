import 'package:dodo/data/models/task_model.dart';
import 'package:dodo/data/repositories/task_repository.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();
  List<TaskModel> _tasks = [];
  List<TaskModel> _searchResults = [];
  bool _isSearching = false;

  List<TaskModel> get tasks => _tasks;
  List<TaskModel> get searchResults => _searchResults;
  bool get isSearching => _isSearching;

  Future<void> fetchTasks() async {
    _tasks = await _repository.getTasks();
    notifyListeners();
  }

  Future<void> addTask(TaskModel task) async {
    await _repository.addTask(task);
    await fetchTasks();
  }

  Future<void> deleteTask(int index) async {
    await _repository.deleteTask(index);
    await fetchTasks();
  }

  Future<void> clearTasks() async {
    await _repository.clearTasks();
    await fetchTasks();
  }

  Future<void> searchTasks(String query) async {
    _isSearching = true;
    notifyListeners();

    try {
      _searchResults = await _repository.searchTasks(query);
    } catch (e) {
      _searchResults = [];
      debugPrint('Error searching tasks: $e');
    } finally {
      _isSearching = false;
      notifyListeners();
    }
  }

  Future<void> completeTask(int index, bool isCompleted) async {
    try {
      await _repository.completeTask(index, isCompleted);
      await fetchTasks();
    } catch (e) {
      debugPrint('Error completing task: $e');
    }
  }

  void clearSearchResults() {
    _searchResults = [];
    notifyListeners();
  }
}
