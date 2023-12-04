import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';

import '../widgets/math_tex_algebraic.dart';

class AlgebraicProcessPage extends ConsumerWidget {
  const AlgebraicProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final eqStyle = textTheme.bodyMedium!.copyWith(fontSize: 22);
    final colorSheme = Theme.of(context).colorScheme;
    final dataAlgebraic = ref.watch(dataControllerForAlgebraicProvider.notifier).toStandardForm();
    final algebraicAnswer = ref
        .watch(dataControllerForAlgebraicProvider.notifier)
        .answerAlgebraic(dataAlgebraic.constraintWithSlack, dataAlgebraic.rightSide);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Programming App'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(spaceL),
              child: Text('Método Algebraico',
                  textAlign: TextAlign.center, style: textTheme.displaySmall),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < dataAlgebraic.constraintsString.length; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int j = 0; j < dataAlgebraic.constraintsString[i].length; j++)
                            MathTexAlgebraic(
                                equation: dataAlgebraic.constraintsString[i][j], eqStyle: eqStyle),
                        ],
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final r in dataAlgebraic.rightSideString)
                          MathTexAlgebraic(equation: r, eqStyle: eqStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: spaceL),
            sliver: SliverToBoxAdapter(
              child: MathTexAlgebraic(
                  equation: dataAlgebraic.greaterThanZeroCondition, eqStyle: eqStyle),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: spaceXL),
            sliver: SliverToBoxAdapter(
              child:
                  MathTexAlgebraic(equation: dataAlgebraic.combinationsEquation, eqStyle: eqStyle),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: spaceXXL),
          ),
          for (final combination in algebraicAnswer.steps)
            SliverPadding(
              padding: const EdgeInsets.all(spaceL),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('${combination.step}. Combinación ', style: eqStyle),
                            MathTexAlgebraic(
                                equation: combination.header, eqStyle: eqStyle, center: false),
                          ],
                        ),
                        const SizedBox(height: spaceM),
                        for (final solString in combination.solutionsString)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Flexible(flex: 2, fit: FlexFit.tight, child: SizedBox()),
                              Flexible(
                                  flex: 7,
                                  fit: FlexFit.tight,
                                  child: MathTexAlgebraic(
                                      equation: solString, eqStyle: eqStyle, center: false)),
                            ],
                          ),
                        combination.solutionString == null
                            ? Text(
                                'Esta combinación no tiene solución',
                                style: textTheme.labelMedium!.copyWith(color: colorSheme.error),
                              )
                            : Card(
                                color: combination.objectiveFunctionSolution ==
                                        algebraicAnswer.definitiveSolution
                                    ? Colors.greenAccent[400]!.withOpacity(0.15)
                                    : Colors.lightBlue.withOpacity(0.15),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: spaceM, horizontal: spaceS),
                                  child: MathTexAlgebraic(
                                      equation: combination.solutionString ?? '', eqStyle: eqStyle),
                                )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.all(spaceXL),
            sliver: SliverToBoxAdapter(
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: spaceXL, vertical: spaceL),
                  child: Center(
                    child: algebraicAnswer.finalSolutionString == null
                        ? const Text(
                            'No existe una solución para este problema de programación lineal.')
                        : Column(
                            children: [
                              Text(
                                  'La solución óptima se encuentra en la combinacion ${algebraicAnswer.step}, así: ',
                                  textAlign: TextAlign.center,
                                  style: eqStyle),
                              const SizedBox(height: spaceM),
                              MathTexAlgebraic(
                                  equation: algebraicAnswer.finalSolutionString ?? '',
                                  eqStyle: eqStyle),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
