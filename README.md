# MultiApp Flutter Showcase

A robust Flutter application demonstrating Clean Architecture, BLoC state management, persistent local notifications with 30-minute lead time reminders, and cross-platform feature implementations.

## Features

- **Todo List**: Task management with local notifications (scheduled 30 minutes before due date).
- **Dynamic Forms**: Schema-driven form generation.
- **E-commerce Showcase**: Product listing and favorites.
- **Device Info**: Accessing system details via platform channels.
- **Nested Navigation**: Deep linking and persistent state across tabs using AutoRoute.

---

## Getting Started

### Prerequisites

To run this project, ensure you have the correct environments set up:

- **Flutter version**: `3.38.4`
- **Dart version**: `3.10.3`

### 1. Clone the Project

```bash
git clone {url}
cd multiapp
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

This project uses `injectable`, `freezed`, and `auto_route` which require code generation. Run the following command:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Setup Local Notifications (Platform Specific)

#### Android
- Ensure the app has the necessary permissions defined in `AndroidManifest.xml` (already included).
- Notification Icon: The app uses `@mipmap/ic_launcher`.

#### iOS
- The app requests alert, badge, and sound permissions on launch.
- Background notification handling is configured in `AppDelegate.swift` and `main.dart`.

### 5. Run the Application

```bash
flutter run
```

---

## 🏗 Architecture

The project follows **Clean Architecture** principles:
- **Domain**: Entities, Repositories (interfaces), and UseCases.
- **Data**: Models, DataSources, and Repository implementations.
- **Presentation**: BLoC/Cubit for state management and UI screens.

## 🛠 Tech Stack

- **Routing**: [AutoRoute](https://pub.dev/packages/auto_route)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
- **State Management**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
- **Local Storage**: [Sqflite](https://pub.dev/packages/sqflite)
- **Notifications**: [Flutter Local Notifications](https://pub.dev/packages/flutter_local_notifications)
- **Date/Time**: [Timezone](https://pub.dev/packages/timezone)

