
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_chat_flutter/tasks_main.dart';

void main() {
  testWidgets('Добавление и удаление задачи', (WidgetTester tester) async {
    await tester.pumpWidget(const TasksApp());

    // При запуске список пуст.
    expect(find.text('Список задач пуст'), findsOneWidget);

    // Добавляем задачу.
    await tester.enterText(
      find.byType(TextField).first,
      'Изучить Flutter',
    );

    await tester.tap(find.byTooltip('Добавить задачу'));
    await tester.pumpAndSettle();

    // Проверяем появление задачи.
    expect(find.text('Изучить Flutter'), findsOneWidget);

    // Удаляем задачу.
    await tester.tap(find.byTooltip('Удалить'));
    await tester.pumpAndSettle();

    // Проверяем, что список снова пуст.
    expect(find.text('Список задач пуст'), findsOneWidget);
  });
}
