
import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TasksApp());
}

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мои задачи',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const TasksScreen(),
    );
  }
}
