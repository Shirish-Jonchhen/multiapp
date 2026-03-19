import 'form_input_entity.dart';

class FormSchemaEntity {
  final String title;
  final List<FormStepEntity> steps;
  const FormSchemaEntity({required this.title, required this.steps});
}

class FormStepEntity {
  final String title;
  final String description;
  final List<FormInputEntity> inputs;
  const FormStepEntity(
      {required this.title, required this.description, required this.inputs});
}
