import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task.dart';
import '../../viewmodels/tasks_viewmodel.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState
    extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController =
      TextEditingController();

  final _descriptionController =
      TextEditingController();

  DateTime? _dueDate;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear tarefa'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration:
                            const InputDecoration(
                          labelText: 'Título',
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'Introduce un título';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller:
                            _descriptionController,
                        decoration:
                            const InputDecoration(
                          labelText: 'Descrición',
                        ),
                        minLines: 3,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder:
                            (context, constraints) {
                          final isNarrow =
                              constraints.maxWidth <
                                  400;

                          final dateText = Text(
                            _dueDate == null
                                ? 'Sen data límite'
                                : 'Data límite: '
                                    '${_dueDate!.day}/'
                                    '${_dueDate!.month}/'
                                    '${_dueDate!.year}',
                          );

                          final dateButton =
                              TextButton(
                            onPressed: _selectDate,
                            child: Text(
                              _dueDate == null
                                  ? 'Seleccionar data'
                                  : 'Cambiar',
                            ),
                          );

                          if (isNarrow) {
                            return Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                dateText,
                                dateButton,
                              ],
                            );
                          }

                          return Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [
                              dateText,
                              dateButton,
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: () async {
                          if (!_formKey
                              .currentState!
                              .validate()) {
                            return;
                          }

                          final descriptionText =
                              _descriptionController
                                  .text
                                  .trim();

                          final task = Task(
                            title:
                                _titleController.text
                                    .trim(),
                            description:
                                descriptionText
                                        .isEmpty
                                    ? null
                                    : descriptionText,
                            dueDate: _dueDate,
                          );

                          await context
                              .read<TasksViewModel>()
                              .addTask(task);

                          if (!context.mounted) {
                            return;
                          }

                          Navigator.of(context).pop();
                        },
                        child:
                            const Text('Crear tarefa'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate:
          _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 3650),
      ),
    );

    if (selectedDate == null) {
      return;
    }

    setState(() {
      _dueDate = selectedDate;
    });
  }
}