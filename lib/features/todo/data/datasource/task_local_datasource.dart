import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task_model.dart';

abstract class TaskLocalDatasource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel?> getTaskById(String id);
  Future<void> insertTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String id);
}

@LazySingleton(as: TaskLocalDatasource)
class TaskLocalDatasourceImpl implements TaskLocalDatasource {
  static Database? _db;

  Future<Database> get database async {
    _db ??= await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'tasks.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            description TEXT,
            isCompleted INTEGER NOT NULL DEFAULT 0,
            dueDate TEXT,
            createdAt TEXT NOT NULL
          )
        ''');
      },
    );
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    final db = await database;
    final result = await db.query('tasks', orderBy: 'createdAt DESC');
    return result.map(TaskModel.fromJson).toList();
  }

  @override
  Future<TaskModel?> getTaskById(String id) async {
    final db = await database;
    final result = await db.query('tasks', where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return TaskModel.fromJson(result.first);
  }

  @override
  Future<void> insertTask(TaskModel task) async {
    final db = await database;
    await db.insert('tasks', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    final db = await database;
    await db.update('tasks', task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  @override
  Future<void> deleteTask(String id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
