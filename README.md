
# Flutter TODO App

Мобильное приложение для управления списком задач, разработанное на Flutter и Dart.

## Возможности

- Добавление новых задач
- Просмотр списка задач
- Редактирование существующих задач
- Удаление задач
- Проверка пустого ввода
- Адаптивный интерфейс на Material Design 3

## Используемые технологии

- Flutter
- Dart
- StatefulWidget
- TextField
- ListView.builder
- setState()
- Material Design 3

## Запуск приложения

Установить зависимости:

```bash
flutter pub get
```

Запустить приложение:

```bash
flutter run
```

## Проверка кода

```bash
flutter analyze
flutter test
```

## Сборка APK

```bash
flutter build apk --release
```

Готовый APK:

`build/app/outputs/flutter-apk/app-release.apk`

## Выполненное задание

Задание 1 (3 балла): создание мобильного приложения для ввода и отображения задач с использованием StatefulWidget, TextField, ListView.builder и реализацией CRUD-операций.

## Дополнительная информация

Приложение задач реализовано в `lib/screens/tasks_screen.dart`.

Основная точка входа — `lib/main.dart`.

Проект создан на основе учебного репозитория AIChatFlutter.
