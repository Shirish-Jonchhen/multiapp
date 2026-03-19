import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/form_schema_entity.dart';
import '../../domain/entities/form_input_entity.dart';
part 'form_schema_model.g.dart';

@JsonSerializable()
class FormSchemaModel {
  final String title;
  final List<FormStepModel> steps;

  const FormSchemaModel({required this.title, required this.steps});

  factory FormSchemaModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('form') && json['form'] is Map<String, dynamic>) {
      return _$FormSchemaModelFromJson(json['form'] as Map<String, dynamic>);
    }
    return _$FormSchemaModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FormSchemaModelToJson(this);

  FormSchemaEntity toEntity() => FormSchemaEntity(
        title: title,
        steps: steps.map((s) => s.toEntity()).toList(),
      );
}

@JsonSerializable()
class FormStepModel {
  final String title;
  final String description;
  final List<FormInputModel> inputs;

  const FormStepModel({
    required this.title,
    required this.description,
    required this.inputs,
  });

  factory FormStepModel.fromJson(Map<String, dynamic> json) =>
      _$FormStepModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormStepModelToJson(this);

  FormStepEntity toEntity() => FormStepEntity(
        title: title,
        description: description,
        inputs: inputs.map((i) => i.toEntity()).toList(),
      );
}

@JsonSerializable()
class FormInputModel {
  final String key;
  final String type;
  final String label;
  final bool required;
  @JsonKey(name: 'default')
  final dynamic defaultValue;
  final List<String>? options;
  final FormValidationModel? validation;

  const FormInputModel({
    required this.key,
    required this.type,
    required this.label,
    required this.required,
    this.defaultValue,
    this.options,
    this.validation,
  });

  factory FormInputModel.fromJson(Map<String, dynamic> json) =>
      _$FormInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormInputModelToJson(this);

  FormInputEntity toEntity() => FormInputEntity(
        key: key,
        type: _parseInputType(type),
        label: label,
        required: required,
        defaultValue: defaultValue,
        options: options ?? [],
        validation: validation?.toEntity(),
      );

  static FormInputType _parseInputType(String type) {
    switch (type) {
      case 'dropdown':
        return FormInputType.dropdown;
      case 'toggle':
        return FormInputType.toggle;
      case 'radio':
        return FormInputType.radio;
      case 'multiselect':
        return FormInputType.multiselect;
      default:
        return FormInputType.text;
    }
  }
}

@JsonSerializable()
class FormValidationModel {
  final bool numberOnly;

  const FormValidationModel({this.numberOnly = false});

  factory FormValidationModel.fromJson(Map<String, dynamic> json) =>
      _$FormValidationModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormValidationModelToJson(this);

  FormValidationEntity toEntity() =>
      FormValidationEntity(numberOnly: numberOnly);
}
