import 'package:flutter/material.dart';
import '../../domain/entities/form_input_entity.dart';

class FormRadioField extends StatelessWidget {
  final FormInputEntity input;
  final dynamic currentValue;
  final ValueChanged<dynamic> onChanged;

  const FormRadioField({
    super.key,
    required this.input,
    this.currentValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${input.label}${input.required ? ' *' : ''}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          ...input.options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: currentValue?.toString(),
              onChanged: (value) => onChanged(value),
              contentPadding: EdgeInsets.zero,
              dense: true,
            );
          }),
        ],
      ),
    );
  }
}
