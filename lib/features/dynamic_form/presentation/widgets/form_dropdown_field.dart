import 'package:flutter/material.dart';
import '../../domain/entities/form_input_entity.dart';

class FormDropdownField extends StatelessWidget {
  final FormInputEntity input;
  final dynamic currentValue;
  final ValueChanged<String?> onChanged;

  const FormDropdownField({
    super.key,
    required this.input,
    required this.currentValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: currentValue != null && currentValue.toString().isNotEmpty
            ? currentValue.toString()
            : null,
        decoration: InputDecoration(
          labelText: input.label,
          border: const OutlineInputBorder(),
        ),
        items: input.options
            .map((option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        onChanged: onChanged,
        validator: (value) {
          if (input.required && (value == null || value.isEmpty)) {
            return '${input.label} is required';
          }
          return null;
        },
      ),
    );
  }
}
