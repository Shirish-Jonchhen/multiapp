// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_schema_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormSchemaModel _$FormSchemaModelFromJson(Map<String, dynamic> json) =>
    FormSchemaModel(
      title: json['title'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => FormStepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormSchemaModelToJson(FormSchemaModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'steps': instance.steps,
    };

FormStepModel _$FormStepModelFromJson(Map<String, dynamic> json) =>
    FormStepModel(
      title: json['title'] as String,
      description: json['description'] as String,
      inputs: (json['inputs'] as List<dynamic>)
          .map((e) => FormInputModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormStepModelToJson(FormStepModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'inputs': instance.inputs,
    };

FormInputModel _$FormInputModelFromJson(Map<String, dynamic> json) =>
    FormInputModel(
      key: json['key'] as String,
      type: json['type'] as String,
      label: json['label'] as String,
      required: json['required'] as bool,
      defaultValue: json['default'],
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      validation: json['validation'] == null
          ? null
          : FormValidationModel.fromJson(
              json['validation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FormInputModelToJson(FormInputModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'type': instance.type,
      'label': instance.label,
      'required': instance.required,
      'default': instance.defaultValue,
      'options': instance.options,
      'validation': instance.validation,
    };

FormValidationModel _$FormValidationModelFromJson(Map<String, dynamic> json) =>
    FormValidationModel(
      numberOnly: json['numberOnly'] as bool? ?? false,
    );

Map<String, dynamic> _$FormValidationModelToJson(
        FormValidationModel instance) =>
    <String, dynamic>{
      'numberOnly': instance.numberOnly,
    };
