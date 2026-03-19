import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toFormattedString() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  }

  String toDateString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get screenSize => MediaQuery.of(this).size;
}

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
