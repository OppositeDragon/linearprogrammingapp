import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';
import 'package:linearprogrammingapp/widgets/textfield_widget.dart';

import '../constants/enums.dart';
import '../controllers/data_entry_controller.dart';
import '../widgets/dropdown_button_widget.dart';
class DataEntryPage extends ConsumerStatefulWidget {
  const DataEntryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends ConsumerState<DataEntryPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dataEntry = ref.watch(dataEntryControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Programming App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spaceL),
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: spaceXL)),
              SliverToBoxAdapter(
                child: Text('Ingreso de datos', textAlign: TextAlign.center, style: textTheme.displaySmall),
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
              const SliverToBoxAdapter(child: Divider(height: spaceXL, thickness: 2)),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(' Funcion objetivo ', textAlign: TextAlign.center, style: textTheme.headlineMedium),
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
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                                    final number = value == null || value.isEmpty ? 0.0 : double.parse(value);
                                    ref.read(dataEntryControllerProvider.notifier).updateObjectiveFunction(i, number);
                                  },
                                  formatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+\.?[0-9]*')),
                                  ],
                                ),
                              ),
                              const SizedBox(width: spaceS),
                              Math.tex(' x_{${i + 1}} ', textStyle: textTheme.bodySmall?.copyWith(fontSize: 30)),
                              if (i < dataEntry.objectiveFunction.length - 1)
                                Math.tex(' + ', textStyle: textTheme.bodySmall?.copyWith(fontSize: 30)),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: Divider(height: spaceXL, thickness: 2)),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text('Restricciones', style: textTheme.headlineMedium),
                    const SizedBox(height: spaceS),
                    for (int i = 0; i < dataEntry.constraints.length; i++)
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(spaceM),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  alignment: WrapAlignment.start,
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
                                                    .updateConstraints(i, j, number);
                                              },
                                              formatters: [
                                                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+\.?[0-9]*')),
                                              ],
                                            ),
                                          ),
																					
                                         
                                          const SizedBox(width: spaceS),
                                          Math.tex(' x_{${j + 1}} ',
                                              textStyle: textTheme.bodySmall?.copyWith(fontSize: 25)),
                                          if (j < dataEntry.objectiveFunction.length - 1)
                                            Math.tex(' + ', textStyle: textTheme.bodySmall?.copyWith(fontSize: 25)),
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
                              const SizedBox(width: spaceM),
                              SizedBox(
                                width: 85,
                                child: TextFieldWidget(
                                  label: '',
                                  isDense: true,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
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
                                    final number = value == null || value.isEmpty ? 0.0 : double.parse(value);
                                    ref.read(dataEntryControllerProvider.notifier).updateConstraintsRS(i, number);
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
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: Divider(height: spaceXL, thickness: 2)),
              SliverToBoxAdapter(
                child: Center(
                  child: FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    child: const Text('Continuar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
