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
    final a = ref.read(simplexControllerProvider);
    final simplexData = ref.read(simplexControllerProvider.notifier).getAnswer();

    Color? cellColor(int i, int j, int k) {
      if (i == simplexData.tableaus.length - 1 && j == 0 && k == simplexData.tableaus[i][j].length - 1) {
        return Colors.tealAccent.withOpacity(0.25);
      }
      if (i != simplexData.tableaus.length - 1) {
        if (simplexData.pivotsCoordinates[i].y == j && simplexData.pivotsCoordinates[i].x == k) {
          return colorScheme.tertiary.withOpacity(0.2);
        }
        if (simplexData.pivotsCoordinates[i].y == j || simplexData.pivotsCoordinates[i].x == k) {
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
          const SliverToBoxAdapter(
            child: Text(''),
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
                          "Paso ${i + 1}",
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
                          for (int j = 0; j < simplexData.tableaus[i].first.length - 1; j++)
                            DataColumn(
                                label: Expanded(
                              child: Center(
                                child: j == simplexData.tableaus[i].first.length - 2
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
                            )),
                        ],
                        rows: [
                          for (int j = 0; j < simplexData.tableaus[i].length; j++)
                            DataRow(
                              cells: [
                                for (int k = 0; k < simplexData.tableaus[i][j].length; k++)
                                  DataCell(
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: cellColor(i, j, k),
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
