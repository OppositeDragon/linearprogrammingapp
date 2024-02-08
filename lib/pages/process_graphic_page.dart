import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/numeric.dart';
import '../constants/strings.dart';
import '../controllers/data_entry_controller.dart';
import '../controllers/graphic_mode_controller.dart';
import '../custom_painters/graphic_process_painter.dart';
import '../models/data_entry_model.dart';
import '../widgets/answer_presentation_widget.dart';
import '../widgets/gobackgohome_buttons_widget.dart';
import '../widgets/share.dart';

class GraphicProcessPage extends ConsumerWidget {
  const GraphicProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
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
        title: const Text('Graphic Method - $title'),
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
                  vertical: spaceXXL,
                ),
                sliver: SliverToBoxAdapter(
                  child: AnswerPresentation(
                    answerPresentation: AnswerPresentationModel(
                      z: x * graphicData.answer.x + y * graphicData.answer.y,
                      variablesData: [
                        (coefficient: x, letter: '1', value: graphicData.answer.x),
                        (coefficient: y, letter: '2', value: graphicData.answer.y),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: spaceXXL,
                  vertical: spaceXXL,
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
