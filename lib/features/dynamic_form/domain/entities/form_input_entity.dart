enum FormInputType { text, dropdown, toggle, radio, multiselect }

class FormInputEntity {
  final String key;
  final FormInputType type;
  final String label;
  final bool required;
  final dynamic defaultValue;
  final List<String> options;
  final FormValidationEntity? validation;

  const FormInputEntity({
    required this.key,
    required this.type,
    required this.label,
    required this.required,
    this.defaultValue,
    this.options = const [],
    this.validation,
  });
}

class FormValidationEntity {
  final bool numberOnly;
  const FormValidationEntity({this.numberOnly = false});
}
