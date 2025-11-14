import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;

  TaskTile({required this.title, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
    );
  }
}
