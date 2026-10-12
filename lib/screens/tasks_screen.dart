

import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tasks = [];

  void _addTask() {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      _tasks.add(text);
    });

    _controller.clear();
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  Future<void> _editTask(int index) async {
    final editController = TextEditingController(
      text: _tasks[index],
    );

    final updatedTask = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Редактировать задачу'),
        content: TextField(
          controller: editController,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Название задачи',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(
              dialogContext,
              editController.text.trim(),
            ),
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );

    editController.dispose();

    if (!mounted || updatedTask == null || updatedTask.isEmpty) {
      return;
    }

    setState(() {
      _tasks[index] = updatedTask;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои задачи'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Новая задача',
                      hintText: 'Введите задачу',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: _addTask,
                  icon: const Icon(Icons.add),
                  tooltip: 'Добавить задачу',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'Список задач пуст',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${index + 1}'),
                            ),
                            title: Text(_tasks[index]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  tooltip: 'Редактировать',
                                  onPressed: () => _editTask(index),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  tooltip: 'Удалить',
                                  onPressed: () => _deleteTask(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
