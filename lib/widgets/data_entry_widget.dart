import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:linearprogrammingapp/constants/routes.dart';
import 'package:linearprogrammingapp/utils/extensions.dart';

import '../constants/enums.dart';
import '../constants/numeric.dart';
import '../controllers/data_entry_controller.dart';
import 'dropdown_button_widget.dart';
import 'textfield_widget.dart';

class DataEntryWidget extends ConsumerStatefulWidget {
  const DataEntryWidget({super.key});
  @override
  ConsumerState<DataEntryWidget> createState() => _DataEntryWidgetState();
}

class _DataEntryWidgetState extends ConsumerState<DataEntryWidget> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dataEntry = ref.watch(dataEntryControllerProvider);
    final processType = ref.read(processTypeControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: formKey,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: spaceXL)),
          SliverToBoxAdapter(
            child: Text('Ingreso de datos',
                textAlign: TextAlign.center, style: textTheme.displaySmall),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: spaceXXL)),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text('Objetivo:', style: textTheme.headlineMedium),
                ),
                const SizedBox(width: spaceM),
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: DropdownButtonWidget(
                      value: dataEntry.objective,
                      items: [
                        for (final objective in Objectives.values)
                          DropdownMenuItem(value: objective, child: Text(objective.label))
                      ],
                      onChanged: (objective) {
                        if (objective == null) return;
                        ref.read(dataEntryControllerProvider.notifier).updateObjective(objective);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(child: Divider(height: spaceXXXL, thickness: 2)),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(' Funcion objetivo ',
                    textAlign: TextAlign.center, style: textTheme.headlineMedium),
                const SizedBox(height: spaceS),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  spacing: spaceM, //horizontal
                  runSpacing: spaceM, //vertical
                  children: [
                    for (int i = 0; i < dataEntry.objectiveFunction.length; i++)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 85,
                            child: TextFieldWidget(
                              label: '',
                              isDense: true,
                              initialValue: dataEntry.objectiveFunction[i] == 0
                                  ? ''
                                  : '${dataEntry.objectiveFunction[i]}'.deleteLastZero(),
                              keyboardType: const TextInputType.numberWithOptions(
                                decimal: true,
                                signed: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Valor invalido';
                                }
                                return null;
                              },
                              onSave: (value) {
                                final number =
                                    value == null || value.isEmpty ? 0.0 : double.parse(value);
                                ref
                                    .read(dataEntryControllerProvider.notifier)
                                    .updateObjectiveFunction(i, number);
                              },
                              formatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+\.?[0-9]*')),
                              ],
                            ),
                          ),
                          const SizedBox(width: spaceS),
                          if (i < dataEntry.objectiveFunction.length - 1)
                            Math.tex(' x_{${i + 1}} + ',
                                textStyle: textTheme.bodySmall?.copyWith(fontSize: 30))
                          else
                            Math.tex(' x_{${i + 1}}',
                                textStyle: textTheme.bodySmall?.copyWith(fontSize: 30)),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: Divider(height: spaceXXXL, thickness: 2)),
          SliverToBoxAdapter(
            child: Text(
              'Restricciones',
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          for (int i = 0; i < dataEntry.constraints.length; i++)
            SliverToBoxAdapter(
              child: Card(
                elevation: spaceS,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: spaceM, horizontal: spaceS),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          alignment: WrapAlignment.end,
                          runAlignment: WrapAlignment.start,
                          spacing: spaceM, //horizontal
                          runSpacing: spaceM, //vertical
                          children: [
                            for (int j = 0; j < dataEntry.objectiveFunction.length; j++)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 85,
                                    child: TextFieldWidget(
                                      label: '',
                                      isDense: true,
                                      initialValue: dataEntry.constraints[i][j] == 0
                                          ? ''
                                          : '${dataEntry.constraints[i][j]}'.deleteLastZero(),
                                      keyboardType: const TextInputType.numberWithOptions(
                                        decimal: true,
                                        signed: true,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return null;
                                        }
                                        if (double.tryParse(value) == null) {
                                          return 'Valor invalido';
                                        }
                                        return null;
                                      },
                                      onSave: (value) {
                                        final number = value == null || value.isEmpty
                                            ? 0.0
                                            : double.parse(value);
                                        ref
                                            .read(dataEntryControllerProvider.notifier)
                                            .updateConstraints(i, j, number);
                                      },
                                      formatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^[0-9]+\.?[0-9]*')),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: spaceS),
                                  if (j < dataEntry.objectiveFunction.length - 1)
                                    Math.tex(' x_{${j + 1}} + ',
                                        textStyle: textTheme.bodySmall?.copyWith(fontSize: 25))
                                  else
                                    Math.tex(' x_{${j + 1}}\\;\\;\\;',
                                        textStyle: textTheme.bodySmall?.copyWith(fontSize: 25)),
                                ],
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: spaceM),
                      SizedBox(
                        width: 70,
                        child: DropdownButtonWidget<Operators>(
                          isDense: true,
                          value: dataEntry.operators[i],
                          items: [
                            for (final operator in Operators.values)
                              DropdownMenuItem(
                                value: operator,
                                child: Center(
                                  child: Text(
                                    operator.label,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                          ],
                          onChanged: (constraint) {
                            if (constraint == null) return;
                            ref
                                .read(dataEntryControllerProvider.notifier)
                                .updateOperator(i, constraint);
                          },
                        ),
                      ),
                      const SizedBox(width: spaceXXXL),
                      SizedBox(
                        width: 85,
                        child: TextFieldWidget(
                          label: '',
                          isDense: true,
                          initialValue: dataEntry.constraints[i].last == 0
                              ? ''
                              : '${dataEntry.constraints[i].last}'.deleteLastZero(),
                          keyboardType:
                              const TextInputType.numberWithOptions(decimal: true, signed: true),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            if (double.tryParse(value) == null) {
                              return 'Valor invalido';
                            }
                            return null;
                          },
                          onSave: (value) {
                            final number =
                                value == null || value.isEmpty ? 0.0 : double.parse(value);
                            ref
                                .read(dataEntryControllerProvider.notifier)
                                .updateConstraintsRS(i, number);
                          },
                          formatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+\.?[0-9]*')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SliverToBoxAdapter(child: Divider(height: spaceXXXL, thickness: 2)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                const Spacer(),
                FocusTraversalGroup(
                  descendantsAreFocusable: false,
                  descendantsAreTraversable: false,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(entryPageControllerProvider.notifier).updatePage(0);
                    },
                    child: const Text('Regresar'),
                  ),
                ),
                const SizedBox(width: spaceXXXL),
                FilledButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      String mensaje = '';
                      final dE = ref.read(dataEntryControllerProvider);
                      if (dE.objectiveFunction.any((element) => element == 0)) {
                        mensaje +=
                            'Se debe asignar valor a todas las variables de la funcion objetivo\n\n';
                      }

                      for (final restriction in dE.constraints) {
                        if (!restriction
                            .getRange(0, restriction.length - 1)
                            .any((element) => element != 0)) {
                          mensaje +=
                              'Todas las restircciones deben tener al menos un valor en sus variables\n';
                          break;
                        }
                      }
                      if (mensaje.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Inconsistencia'),
                              content: Text(mensaje),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      switch (processType) {
                        case ProcessTypes.algebraic:
                          context.goNamed(routeAlgebraicProcessName);
                          break;
                        case ProcessTypes.graphic:
                          context.goNamed(routeGraphicProcessName);
                          break;
                        case ProcessTypes.simplex:
                          context.goNamed(routeSimplexProcessName);
                          break;
                        default:
                          throw UnsupportedError('Process type not supported');
                      }
                    }
                  },
                  child: const Text('Calcular'),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: spaceL)),
        ],
      ),
    );
  }
}
