import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';
import 'package:linearprogrammingapp/widgets/textfield_widget.dart';

import '../constants/enums.dart';
import '../controllers/data_entry_controller.dart';
import '../widgets/dropdown_button_widget.dart';

class DataEntryPage extends ConsumerWidget {
  const DataEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataEntry = ref.watch(dataEntryControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Programming App - Ingreso de datos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spaceL),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: spaceL)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Text('Objetivo:')),
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
                  const Text(
                    'Funcion objetivo: ',
                    textAlign: TextAlign.center,
                  ),
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
                            const SizedBox(
                              width: 85,
                              child: TextFieldWidget(
                                label: '',
                                isDense: true,
                              ),
                            ),
                            Text(' X${i + 1}'),
                            if (i < dataEntry.objectiveFunction.length - 1) const Text(' + '),
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
                  const Text('Restricciones:'),
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
                                  for (int i = 0; i < dataEntry.objectiveFunction.length; i++)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 85,
                                          child: TextFieldWidget(
                                            label: '',
                                            isDense: true,
                                          ),
                                        ),
                                        Text(' X${i + 1} '),
                                        if (i < dataEntry.objectiveFunction.length - 1) const Text(' + '),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: spaceM),
                            SizedBox(
                              width: 65,
                              child: DropdownButtonWidget<Operators>(
                                isDense: true,
                                value: dataEntry.operators[i],
                                items: [
                                  for (final operator in Operators.values)
                                    DropdownMenuItem(value: operator, child: Text(operator.label))
                                ],
                                onChanged: (constraint) {
                                  if (constraint == null) return;
                                  ref.read(dataEntryControllerProvider.notifier).updateOperator(i, constraint);
                                },
                              ),
                            ),
                            const SizedBox(width: spaceM),
                            const SizedBox(
                              width: 85,
                              child: TextFieldWidget(
                                label: '',
                                isDense: true,
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
                  onPressed: () {},
                  child: const Text('Continuar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
