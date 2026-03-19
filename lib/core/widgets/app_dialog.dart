import 'package:flutter/material.dart';

class AppDialog {
  static Future<bool?> showConfirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_, false),
            child: Text(cancelLabel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(_, true),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  static Future<void> showInfo(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(_).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
