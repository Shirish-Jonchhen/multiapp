import 'package:flutter/material.dart';
import '../../domain/entities/form_input_entity.dart';

class FormToggleField extends StatelessWidget {
  final FormInputEntity input;
  final dynamic currentValue;
  final ValueChanged<bool> onChanged;

  const FormToggleField({
    super.key,
    required this.input,
    required this.currentValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SwitchListTile(
        title: Text(input.label),
        value: currentValue == true,
        onChanged: onChanged,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
