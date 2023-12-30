import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/numeric.dart';
import '../controllers/data_entry_controller.dart';
import '../controllers/graphic_mode_controller.dart';
import '../custom_painters/graphic_process_painter.dart';
import '../widgets/gobackgohome_buttons_widget.dart';
import '../widgets/share.dart';

class GraphicProcessPage extends ConsumerWidget {
  const GraphicProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final graphicData = ref.watch(graphicControllerProvider);
    final dataEntry = ref.watch(dataEntryControllerProvider);
    final [x, y, ...] = dataEntry.objectiveFunction;
    double aspectRatio = graphicData.xLimit / graphicData.yLimit;
    if (aspectRatio > 1.5) {
      aspectRatio = 1.5;
    } else if (aspectRatio < 0.5) {
      aspectRatio = 0.5;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphic Method - Linear Programming App'),
        centerTitle: true,
        actions: const [ShareWidget()],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            primary: true,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(spaceXL),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: LimitedBox(
                      maxHeight: constraints.maxHeight - spaceM * 8,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.colorScheme.onSurface,
                            width: 1,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: aspectRatio,
                          child: RepaintBoundary(
                            child: InteractiveViewer(
                              child: CustomPaint(
                                painter: GraphicProcessPainter(
                                  theme: theme,
                                  answerData: graphicData,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: spaceXL,
                  vertical: spaceL,
                ),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'La solucion optima se encuentra en los puntos x=${graphicData.answer.x}, y=${graphicData.answer.y}. Así:  ',
                          style: textTheme.headlineMedium!.copyWith(fontFamily: 'CMRomanSerif'),
                        ),
                        const SizedBox(height: spaceXL),
                        FittedBox(
                          child: Math.tex(
                            'Z=$x (${graphicData.answer.x}) +$y (${graphicData.answer.y}) = ${x * graphicData.answer.x + y * graphicData.answer.y}',
                            textStyle: textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: spaceXXL,
                  vertical: spaceXL,
                ),
                sliver: SliverToBoxAdapter(child: GoBackGoHomeButtons()),
              ),
            ],
          );
        },
      ),
    );
  }
}
