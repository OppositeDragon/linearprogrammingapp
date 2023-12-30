import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/enums.dart';
import '../constants/numeric.dart';
import '../constants/routes.dart';
import '../constants/strings.dart';
import '../controllers/data_entry_controller.dart';
import 'dropdown_button_widget.dart';
import 'textfield_widget.dart';

class DataEntryWidget extends ConsumerStatefulWidget {
  const DataEntryWidget({super.key});
  @override
  ConsumerState<DataEntryWidget> createState() => _DataEntryWidgetState();
}

class _DataEntryWidgetState extends ConsumerState<DataEntryWidget> {
  final List<TextEditingController> objectiveFunctionControllers = [];
  final List<List<TextEditingController>> constraintsControllers = [];
  final formKey = GlobalKey<FormState>();
  final regExpSignNum = RegExp(r'(^\-?\d*\.?\d*)');
  @override
  void initState() {
    super.initState();
    final dataEntry = ref.read(dataEntryControllerProvider);
    //initialize text field controllers for objective function and adds
    //listeners to objective function controllers, if value can be parsed to
    //double, update on provider.
    for (int i = 0; i < dataEntry.objectiveFunction.length; i++) {
      objectiveFunctionControllers.add(
        TextEditingController()
          ..text = dataEntry.objectiveFunction[i] == 0 ? '' : '${dataEntry.objectiveFunction[i]}'
          ..addListener(() {
            final value = objectiveFunctionControllers[i].text.isEmpty ? '0' : objectiveFunctionControllers[i].text;
            if (double.tryParse(value) != null) {
              ref.read(dataEntryControllerProvider.notifier).updateObjectiveFunction(i, double.parse(value));
            }
          }),
      );
    }
    //initialize text field controllers for constraints and adds listeners to
    //constraints controllers, if value can be parsed to double, update on
    //provider.
    for (int i = 0; i < dataEntry.constraints.length; i++) {
      constraintsControllers.add([]);
      for (int j = 0; j < dataEntry.constraints[i].length; j++) {
        constraintsControllers[i].add(
          TextEditingController()
            ..text = dataEntry.constraints[i][j] == 0 ? '' : '${dataEntry.constraints[i][j]}'
            ..addListener(() {
              final value = constraintsControllers[i][j].text.isEmpty ? '0' : constraintsControllers[i][j].text;
              if (double.tryParse(value) != null) {
                ref.read(dataEntryControllerProvider.notifier).updateConstraints(i, j, double.parse(value));
              }
            }),
        );
      }
    }
  }

  @override
  void dispose() {
    for (final controller in objectiveFunctionControllers) {
      controller.dispose();
    }
    for (final controllerList in constraintsControllers) {
      for (final controller in controllerList) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataEntry = ref.watch(dataEntryControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: formKey,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: spaceXL)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(child: Text('Ingreso de datos', textAlign: TextAlign.center, style: textTheme.displaySmall)),
                IconButton(
                  onPressed: clearControllers,
                  icon: const Icon(Icons.backspace),
                  tooltip: 'Clear all fields',
                ),
              ],
            ),
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
                Text(
                  ' Funcion objetivo ',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
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
                              controller: objectiveFunctionControllers[i],
                              autoFocus: i == 0 ? true : false,
                              selectAllOnGainFocus: true,
                              action: TextInputAction.next,
                              onEditingComplete: FocusScope.of(context).nextFocus,
                              keyboardType: const TextInputType.numberWithOptions(
                                decimal: true,
                                signed: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                                if (double.tryParse(value) == null) {
                                  return invalidMessage;
                                }
                                return null;
                              },
                              onSave: (value) {
                                final number = value == null || value.isEmpty ? 0.0 : double.parse(value);
                                ref.read(dataEntryControllerProvider.notifier).updateObjectiveFunction(i, number);
                              },
                              formatters: [FilteringTextInputFormatter.allow(regExpSignNum)],
                            ),
                          ),
                          const SizedBox(width: spaceS),
                          i == dataEntry.objectiveFunction.length - 1
                              ? Math.tex(' x_{${i + 1}}', textStyle: textTheme.bodySmall?.copyWith(fontSize: 30))
                              : Math.tex(' x_{${i + 1}} + ', textStyle: textTheme.bodySmall?.copyWith(fontSize: 30)),
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
          SliverList.builder(
            itemCount: dataEntry.constraints.length,
            itemBuilder: (context, i) {
              return Card(
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
                                    width: 75,
                                    child: TextFieldWidget(
                                      label: '',
                                      isDense: true,
                                      controller: constraintsControllers[i][j],
                                      keyboardType: const TextInputType.numberWithOptions(
                                        decimal: true,
                                        signed: true,
                                      ),
                                      selectAllOnGainFocus: true,
                                      onEditingComplete: FocusScope.of(context).nextFocus,
                                      action: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return null;
                                        }
                                        if (double.tryParse(value) == null) {
                                          return invalidMessage;
                                        }
                                        return null;
                                      },
                                      onSave: (value) {
                                        final number = value == null || value.isEmpty ? 0.0 : double.parse(value);
                                        ref.read(dataEntryControllerProvider.notifier).updateConstraints(i, j, number);
                                      },
                                      formatters: [FilteringTextInputFormatter.allow(regExpSignNum)],
                                    ),
                                  ),
                                  const SizedBox(width: spaceS),
                                  j == dataEntry.objectiveFunction.length - 1
                                      ? Math.tex(' x_{${j + 1}}\\;\\;\\;',
                                          textStyle: textTheme.bodySmall?.copyWith(fontSize: 25))
                                      : Math.tex(' x_{${j + 1}} + ',
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
                            ref.read(dataEntryControllerProvider.notifier).updateOperator(i, constraint);
                          },
                        ),
                      ),
                      const SizedBox(width: spaceXXXL),
                      SizedBox(
                        width: 85,
                        child: TextFieldWidget(
                          label: '',
                          isDense: true,
                          controller: constraintsControllers[i].last,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                            signed: true,
                          ),
                          selectAllOnGainFocus: true,
                          onEditingComplete:
                              i == dataEntry.constraints.length - 1 ? tryContinue : FocusScope.of(context).nextFocus,
                          action: i == dataEntry.constraints.length - 1 ? TextInputAction.done : TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            if (double.tryParse(value) == null) {
                              return invalidMessage;
                            }
                            return null;
                          },
                          onSave: (value) {
                            final number = value == null || value.isEmpty ? 0.0 : double.parse(value);
                            ref.read(dataEntryControllerProvider.notifier).updateConstraintsRS(i, number);
                          },
                          formatters: [FilteringTextInputFormatter.allow(regExpSignNum)],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
                  onPressed: tryContinue,
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

  void tryContinue() {
    if (formKey.currentState!.validate()) {
      String mensaje = '';
      final dE = ref.read(dataEntryControllerProvider);
      if (dE.objectiveFunction.any((element) => element == 0)) {
        mensaje += 'Se debe asignar valor a todas las variables de la funcion objetivo\n\n';
      }

      for (final restriction in dE.constraints) {
        if (!restriction.getRange(0, restriction.length - 1).any((element) => element != 0)) {
          mensaje += 'Todas las restricciones deben tener valor en por lo menos una de sus variables\n';
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
      final processType = ref.read(processTypeControllerProvider);
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
  }

  void clearControllers() {
    for (final controller in objectiveFunctionControllers) {
      controller.clear();
    }
    for (final controllerList in constraintsControllers) {
      for (final controller in controllerList) {
        controller.clear();
      }
    }
    ref.invalidate(dataEntryControllerProvider);
  }
}
