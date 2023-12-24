import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/numeric.dart';
import '../controllers/simplex_mode_controller.dart';
import '../widgets/gobackgohome_buttons_widget.dart';

class SimplexProcessPage extends ConsumerWidget {
  const SimplexProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final simplexData = ref.watch(simplexControllerProvider);
    Color? getCellColor(int i, int j, int k, List<Point<int>> pivots, int dataLength, int rowLength) {
      if (i == dataLength - 1) {
        if (j == 0 && k == rowLength - 1) {
          return Colors.tealAccent.withOpacity(0.25);
        }
      } else {
        final int x = pivots[i].x;
        final int y = pivots[i].y;
        if (y == j && x + 1 == k) {
          return colorScheme.tertiary.withOpacity(0.2);
        }
        if (y == j || x + 1 == k) {
          return colorScheme.primary.withOpacity(0.08);
        }
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simplex Method - Linear Programming App'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          if (simplexData.tableaus1st != null)
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: spaceXXL,
                vertical: spaceXL,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Fase 1",
                  style: textTheme.displayMedium!.copyWith(fontFamily: 'CMRomanSerif'),
                ),
              ),
            ),
          if (simplexData.tableaus1st != null)
            SliverList.builder(
              itemCount: simplexData.tableaus1st!.length,
              itemBuilder: (context, i) {
                return Center(
                  child: SingleChildScrollView(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(spaceS),
                          child: Text(
                            "Iteración ${i + 1}",
                            style: textTheme.displaySmall!.copyWith(
                              fontFamily: 'CMClassic', //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        DataTable(
                          headingRowColor: const MaterialStatePropertyAll(Colors.black26),
                          columnSpacing: 0,
                          checkboxHorizontalMargin: 0,
                          horizontalMargin: 0,
                          columns: [
                            const DataColumn(label: Text('')),
                            for (int j = 0; j < simplexData.tableaus1st![i].last.length - 1; j++)
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: j == simplexData.tableaus1st![i].last.length - 2
                                        ? Text(
                                            ' Lado\n  derecho  ',
                                            textAlign: TextAlign.center,
                                            style: textTheme.titleMedium!.copyWith(
                                              fontFamily: 'CMRomanSerif',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : Math.tex(
                                            'x_${j + 1}',
                                            textStyle: textTheme.titleLarge,
                                            mathStyle: MathStyle.display,
                                          ),
                                  ),
                                ),
                              ),
                          ],
                          rows: [
                            for (int j = 0; j < simplexData.tableaus1st![i].length; j++)
                              DataRow(
                                cells: [
                                  for (int k = 0; k < simplexData.tableaus1st![i][j].length; k++)
                                    DataCell(
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: getCellColor(
                                            i,
                                            j,
                                            k,
                                            simplexData.pivotsCoordinates1st!,
                                            simplexData.tableaus1st!.length,
                                            -1,
                                          ),
                                        ),
                                        child: SizedBox.expand(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: spaceXXXL),
                                            child: Center(
                                              child: k == 0
                                                  ? Math.tex(simplexData.tableaus1st![i][j][k],
                                                      textStyle: textTheme.titleLarge)
                                                  : Text(
                                                      simplexData.tableaus1st![i][j][k],
                                                      style: textTheme.bodyLarge!.copyWith(
                                                        fontFamily: 'CMRomanSerif',
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          if (simplexData.tableaus1st != null)
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: spaceXXL,
                vertical: spaceXL,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Fase 2",
                  style: textTheme.displayMedium!.copyWith(fontFamily: 'CMRomanSerif'),
                ),
              ),
            ),
          SliverList.builder(
            itemCount: simplexData.tableaus.length,
            itemBuilder: (context, i) {
              return Center(
                child: SingleChildScrollView(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(spaceS),
                        child: Text(
                          "Iteración ${i + 1}",
                          style: textTheme.displaySmall!.copyWith(
                            fontFamily: 'CMClassic', //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      DataTable(
                        headingRowColor: const MaterialStatePropertyAll(Colors.black26),
                        columnSpacing: 0,
                        checkboxHorizontalMargin: 0,
                        horizontalMargin: 0,
                        columns: [
                          const DataColumn(label: Text('')),
                          for (int j = 0; j < simplexData.tableaus[i].last.length - 1; j++)
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: j == simplexData.tableaus[i].last.length - 2
                                      ? Text(
                                          ' Lado\n  derecho  ',
                                          textAlign: TextAlign.center,
                                          style: textTheme.titleMedium!.copyWith(
                                            fontFamily: 'CMRomanSerif',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Math.tex(
                                          'x_${j + 1}',
                                          textStyle: textTheme.titleLarge,
                                          mathStyle: MathStyle.display,
                                        ),
                                ),
                              ),
                            ),
                        ],
                        rows: [
                          for (int j = 0; j < simplexData.tableaus[i].length; j++)
                            DataRow(
                              cells: [
                                for (int k = 0; k < simplexData.tableaus[i][j].length; k++)
                                  DataCell(
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: getCellColor(
                                          i,
                                          j,
                                          k,
                                          simplexData.pivotsCoordinates,
                                          simplexData.tableaus.length,
                                          simplexData.tableaus[i][j].length,
                                        ),
                                      ),
                                      child: SizedBox.expand(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: spaceXXXL),
                                          child: Center(
                                            child: k == 0
                                                ? Math.tex(simplexData.tableaus[i][j][k],
                                                    textStyle: textTheme.titleLarge)
                                                : Text(
                                                    simplexData.tableaus[i][j][k],
                                                    style: textTheme.bodyLarge!.copyWith(
                                                      fontFamily: 'CMRomanSerif',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: spaceXXL,
              vertical: spaceXL,
            ),
            sliver: SliverToBoxAdapter(child: GoBackGoHomeButtons()),
          ),
        ],
      ),
    );
  }
}
