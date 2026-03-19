import 'package:flutter/material.dart';
import '../../domain/entities/form_input_entity.dart';

class FormTextField extends StatelessWidget {
  final FormInputEntity input;
  final dynamic currentValue;
  final ValueChanged<String> onChanged;

  const FormTextField({
    super.key,
    required this.input,
    required this.currentValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        initialValue: currentValue?.toString() ?? '',
        decoration: InputDecoration(
          labelText: input.label,
          border: const OutlineInputBorder(),
          suffixIcon: input.required
              ? const Icon(Icons.star, size: 12, color: Colors.red)
              : null,
        ),
        keyboardType: input.validation?.numberOnly == true
            ? TextInputType.number
            : TextInputType.text,
        onChanged: onChanged,
        validator: (value) {
          if (input.required && (value == null || value.isEmpty)) {
            return '${input.label} is required';
          }
          if (input.validation?.numberOnly == true &&
              value != null &&
              value.isNotEmpty) {
            if (int.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
          }
          return null;
        },
      ),
    );
  }
}
