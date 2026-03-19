import 'package:flutter/material.dart';

class FormReviewStep extends StatelessWidget {
  final Map<String, dynamic> formValues;

  const FormReviewStep({super.key, required this.formValues});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review Your Responses',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: formValues.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _formatKey(entry.key),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Text(': '),
                      Expanded(
                        child: Text(
                          (entry.value == null || entry.value.toString().trim().isEmpty)
                              ? 'Not Assigned'
                              : entry.value.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  String _formatKey(String key) {
    return key
        .replaceAllMapped(
            RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}')
        .split(RegExp(r'[_\s]'))
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '')
        .join(' ')
        .trim();
  }
}
