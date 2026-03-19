import 'package:flutter/material.dart';
import '../../domain/entities/form_input_entity.dart';

class FormMultiselectField extends StatelessWidget {
  final FormInputEntity input;
  final dynamic currentValue;
  final ValueChanged<dynamic> onChanged;

  const FormMultiselectField({
    super.key,
    required this.input,
    this.currentValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // currentValue should be a List<String>
    final selectedValues = (currentValue is List)
        ? List<String>.from(currentValue)
        : <String>[];

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
            final isSelected = selectedValues.contains(option);
            return CheckboxListTile(
              title: Text(option),
              value: isSelected,
              onChanged: (checked) {
                final newValues = List<String>.from(selectedValues);
                if (checked == true) {
                  newValues.add(option);
                } else {
                  newValues.remove(option);
                }
                onChanged(newValues);
              },
              contentPadding: EdgeInsets.zero,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
        ],
      ),
    );
  }
}
