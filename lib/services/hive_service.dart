import 'package:hive/hive.dart';

class HiveService {
  final String boxName = 'tasks';

  /// Open Hive box
  Future<Box> openBox() async {
    return await Hive.openBox(boxName);
  }

  /// Add a new task
  Future<void> addTask(String task) async {
    var box = Hive.box(boxName);
    await box.add(task);
  }

  /// Get all tasks
  List<String> getTasks() {
    var box = Hive.box(boxName);
    return box.values.cast<String>().toList();
  }

  /// Delete task by index
  Future<void> deleteTask(int index) async {
    var box = Hive.box(boxName);
    await box.deleteAt(index);
  }

  /// Update task by index
  Future<void> updateTask(int index, String newTask) async {
    var box = Hive.box(boxName);
    await box.putAt(index, newTask);
  }

  /// Clear all tasks
  Future<void> clearTasks() async {
    var box = Hive.box(boxName);
    await box.clear();
  }

  /// Get task count
  int taskCount() {
    var box = Hive.box(boxName);
    return box.length;
  }
}
