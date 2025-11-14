import 'package:flutter/material.dart';
import '../services/hive_service.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HiveService hiveService = HiveService();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() {
    setState(() {
      tasks = hiveService.getTasks();
    });
  }

  void deleteTask(int index) async {
    await hiveService.deleteTask(index);
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: tasks.isEmpty
          ? Center(child: Text('No tasks yet. Add one!'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  title: tasks[index],
                  onDelete: () => deleteTask(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen()),
          );
          loadTasks();
        },
      ),
    );
  }
}
