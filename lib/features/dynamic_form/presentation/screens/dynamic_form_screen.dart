import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiapp/core/widgets/app_dialog.dart';
import 'package:multiapp/core/widgets/error_widget.dart';
import 'package:multiapp/core/widgets/loading_widget.dart';
import '../../domain/entities/form_input_entity.dart';
import '../bloc/form_cubit.dart';
import '../bloc/form_state.dart';
import '../widgets/form_text_field.dart';
import '../widgets/form_dropdown_field.dart';
import '../widgets/form_toggle_field.dart';
import '../widgets/form_radio_field.dart';
import '../widgets/form_multiselect_field.dart';
import '../widgets/form_review_step.dart';

@RoutePage()
class DynamicFormScreen extends StatelessWidget {
  const DynamicFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form'),
        centerTitle: true,
      ),
      body: BlocConsumer<FormCubit, FormCubitState>(
        listener: (context, state) {
          if (state.showResumeDialog) {
            AppDialog.showConfirm(
              context,
              title: 'Resume Form',
              message:
                  'You have saved progress. Would you like to resume where you left off?',
              confirmLabel: 'Resume',
              cancelLabel: 'Start Fresh',
            ).then((result) {
              context.read<FormCubit>().resumeProgress(result ?? false);
            });
          }
          if (state.showSubmitDialog) {
            AppDialog.showInfo(
              context,
              title: 'Form Submitted',
              message: 'Your form has been submitted successfully!',
            );
            context.read<FormCubit>().dismissSubmitDialog();
          }
        },
        builder: (context, state) {
          if (state.schemaStatus == FormApiStatus.loading) {
            return const LoadingSpinner();
          }
          if (state.schemaStatus == FormApiStatus.failure) {
            return AppErrorWidget(
              message: state.errorMessage ?? 'Failed to load form',
              onRetry: () => context.read<FormCubit>().loadSchema(),
            );
          }
          if (state.schema == null) {
            return const Center(child: Text('No form schema available'));
          }

          final schema = state.schema!;

          return Column(
            children: [
              // Steps
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: List.generate(schema.steps.length, (index) {
                    final isActive = index == state.currentStep;
                    final isCompleted = index < state.currentStep;
                    return Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: isCompleted
                                ? Colors.green
                                : isActive
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.grey[300],
                            child: isCompleted
                                ? const Icon(Icons.check,
                                    size: 16, color: Colors.white)
                                : Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      color: isActive
                                          ? Colors.white
                                          : Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                          ),
                          if (index < schema.steps.length - 1)
                            Expanded(
                              child: Container(
                                height: 2,
                                color: isCompleted
                                    ? Colors.green
                                    : Colors.grey[300],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              // Step content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schema.steps[state.currentStep].title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        schema.steps[state.currentStep].description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 24),
                      if (state.isLastStep)
                        FormReviewStep(formValues: state.formValues)
                      else
                        ...schema.steps[state.currentStep].inputs.map(
                          (input) => _buildInputWidget(context, input, state),
                        ),
                    ],
                  ),
                ),
              ),

              // Navigation buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (state.currentStep > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              context.read<FormCubit>().previousStep(),
                          child: const Text('Previous'),
                        ),
                      ),
                    if (state.currentStep > 0) const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: state.isSubmitting
                            ? null
                            : () {
                                if (state.isLastStep) {
                                  context.read<FormCubit>().submit();
                                } else {
                                  context.read<FormCubit>().nextStep();
                                }
                              },
                        child: state.isSubmitting
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(state.isLastStep ? 'Submit' : 'Next'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInputWidget(
      BuildContext context, FormInputEntity input, FormCubitState state) {
    final cubit = context.read<FormCubit>();
    final currentValue = state.formValues[input.key] ?? input.defaultValue;

    switch (input.type) {
      case FormInputType.text:
        return FormTextField(
          input: input,
          currentValue: currentValue,
          onChanged: (value) => cubit.updateFieldValue(input.key, value),
        );
      case FormInputType.dropdown:
        return FormDropdownField(
          input: input,
          currentValue: currentValue,
          onChanged: (value) => cubit.updateFieldValue(input.key, value),
        );
      case FormInputType.toggle:
        return FormToggleField(
          input: input,
          currentValue: currentValue,
          onChanged: (value) => cubit.updateFieldValue(input.key, value),
        );
      case FormInputType.radio:
        return FormRadioField(
          input: input,
          currentValue: currentValue,
          onChanged: (value) => cubit.updateFieldValue(input.key, value),
        );
      case FormInputType.multiselect:
        return FormMultiselectField(
          input: input,
          currentValue: currentValue,
          onChanged: (value) => cubit.updateFieldValue(input.key, value),
        );
    }
  }
}
