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
    final dataAlgebraic = ref.watch(dataControllerForAlgebraicProvider.notifier).toStandardForm();

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
              child: Text('Método Algebraico', textAlign: TextAlign.center, style: textTheme.displaySmall),
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
                            MathTexAlgebraic(equation: dataAlgebraic.constraintsString[i][j], eqStyle: eqStyle),
                        ],
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final r in dataAlgebraic.rightSideString) MathTexAlgebraic(equation: r, eqStyle: eqStyle),
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
              child: MathTexAlgebraic(equation: dataAlgebraic.greaterThanZeroCondition, eqStyle: eqStyle),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: spaceXXL),
            sliver: SliverToBoxAdapter(
              child: MathTexAlgebraic(equation: dataAlgebraic.combinationsEquation, eqStyle: eqStyle),
            ),
          ),
        ],
      ),
    );
  }
}
