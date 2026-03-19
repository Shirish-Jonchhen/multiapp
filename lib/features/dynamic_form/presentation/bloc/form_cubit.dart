import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/form_schema_entity.dart';
import '../../domain/usecases/load_form_schema_usecase.dart';
import '../../domain/usecases/save_form_progress_usecase.dart';
import '../../domain/usecases/restore_form_progress_usecase.dart';
import '../../domain/repository/form_repository.dart';
import 'form_state.dart';

@injectable
class FormCubit extends Cubit<FormCubitState> {
  final LoadFormSchemaUseCase loadFormSchemaUseCase;
  final SaveFormProgressUseCase saveFormProgressUseCase;
  final RestoreFormProgressUseCase restoreFormProgressUseCase;
  final FormRepository formRepository;

  FormCubit({
    required this.loadFormSchemaUseCase,
    required this.saveFormProgressUseCase,
    required this.restoreFormProgressUseCase,
    required this.formRepository,
  }) : super(const FormCubitState());

  Future<void> loadSchema() async {
    emit(state.copyWith(schemaStatus: FormApiStatus.loading));
    final result = await loadFormSchemaUseCase();
    await result.fold(
      (failure) async => emit(state.copyWith(
        schemaStatus: FormApiStatus.failure,
        errorMessage: failure.message,
      )),
      (schema) async {
        final initialValues = _getInitialValues(schema);

        emit(state.copyWith(
          schemaStatus: FormApiStatus.success,
          schema: schema,
          formValues: initialValues,
        ));

        // Check for saved progress
        final progressResult = await restoreFormProgressUseCase();
        progressResult.fold(
          (_) {},
          (progress) {
            if (progress != null) {
              emit(state.copyWith(showResumeDialog: true));
            }
          },
        );
      },
    );
  }

  Future<void> resumeProgress(bool resume) async {
    if (resume) {
      final progressResult = await restoreFormProgressUseCase();
      progressResult.fold(
        (_) {},
        (progress) {
          if (progress != null) {
            final step = progress['step'] as int? ?? 0;
            final prevValues =
                Map<String, dynamic>.from(progress['values'] as Map? ?? {});
            final mergedValues = Map<String, dynamic>.from(state.formValues);
            mergedValues.addAll(prevValues);
            emit(state.copyWith(
              currentStep: step,
              formValues: mergedValues,
              showResumeDialog: false,
            ));
          }
        },
      );
    } else {
      await formRepository.clearFormProgress();
      final initialValues =
          state.schema != null ? _getInitialValues(state.schema!) : <String, dynamic>{};
      emit(state.copyWith(
        currentStep: 0,
        formValues: initialValues,
        showResumeDialog: false,
      ));
    }
  }

  Map<String, dynamic> _getInitialValues(FormSchemaEntity schema) {
    final values = <String, dynamic>{};
    for (final step in schema.steps) {
      for (final input in step.inputs) {
        values[input.key] = '';
      }
    }
    return values;
  }

  Future<void> nextStep() async {
    if (!state.isLastStep) {
      final nextStep = state.currentStep + 1;
      await saveFormProgressUseCase(nextStep, state.formValues);
      emit(state.copyWith(currentStep: nextStep));
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void updateFieldValue(String key, dynamic value) {
    final updatedValues = Map<String, dynamic>.from(state.formValues);
    updatedValues[key] = value;
    emit(state.copyWith(formValues: updatedValues));
  }

  Future<void> submit() async {
    emit(state.copyWith(isSubmitting: true));
    // Simulate submission delay
    await Future.delayed(const Duration(seconds: 1));
    await formRepository.clearFormProgress();
    
    // Reset the form state locally
    final initialValues =
        state.schema != null ? _getInitialValues(state.schema!) : <String, dynamic>{};
    
    emit(state.copyWith(
      isSubmitting: false,
      showSubmitDialog: true,
      currentStep: 0,
      formValues: initialValues,
    ));
  }

  void dismissResumeDialog() {
    emit(state.copyWith(showResumeDialog: false));
  }

  void dismissSubmitDialog() {
    emit(state.copyWith(showSubmitDialog: false));
  }
}
