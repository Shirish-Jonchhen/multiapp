import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/form_schema_entity.dart';
import '../../domain/entities/form_input_entity.dart';
part 'form_state.freezed.dart';

enum FormApiStatus { initial, loading, success, failure }

@freezed
class FormCubitState with _$FormCubitState {
  const FormCubitState._();

  const factory FormCubitState({
    @Default(FormApiStatus.initial) FormApiStatus schemaStatus,
    @Default(0) int currentStep,
    @Default({}) Map<String, dynamic> formValues,
    @Default(false) bool showResumeDialog,
    @Default(false) bool showSubmitDialog,
    @Default(false) bool isSubmitting,
    String? errorMessage,
    FormSchemaEntity? schema,
  }) = _FormCubitState;

  bool get isLastStep =>
      schema != null ? currentStep == schema!.steps.length - 1 : false;
  int get totalSteps => schema?.steps.length ?? 0;
  FormStepEntity? get currentStepEntity =>
      schema != null && currentStep < schema!.steps.length
          ? schema!.steps[currentStep]
          : null;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
