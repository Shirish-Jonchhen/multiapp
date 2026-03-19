import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FormLocalDatasource {
  Future<String> loadFormSchema();
  Future<void> saveProgress(int step, Map<String, dynamic> values);
  Future<Map<String, dynamic>?> restoreProgress();
  Future<void> clearProgress();
}

@LazySingleton(as: FormLocalDatasource)
class FormLocalDatasourceImpl implements FormLocalDatasource {
  static const _progressKey = 'form_progress';

  @override
  Future<String> loadFormSchema() async {
    return await rootBundle.loadString('assets/form.json');
  }

  @override
  Future<void> saveProgress(int step, Map<String, dynamic> values) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode({'step': step, 'values': values});
    await prefs.setString(_progressKey, data);
  }

  @override
  Future<Map<String, dynamic>?> restoreProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_progressKey);
    if (data == null) return null;
    return jsonDecode(data) as Map<String, dynamic>;
  }

  @override
  Future<void> clearProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_progressKey);
  }
}
