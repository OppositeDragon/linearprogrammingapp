import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/numeric.dart';
import '../controllers/graphic_mode_controller.dart';
import '../custom_painters/graphic_process_painter.dart';

class GraphicProcessPage extends ConsumerWidget {
  const GraphicProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final graphicData = ref.watch(graphicControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Programming App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Metodo Gráfico',
              textAlign: TextAlign.center,
              style: textTheme.displaySmall,
            ),
          ),
          Expanded(
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(spaceM),
                child: RepaintBoundary(
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
          const SizedBox(height: spaceL),
          const FilledButton(onPressed: null, child: Text('Aceptar')),
          const SizedBox(height: spaceXL),
        ],
      ),
    );
  }
}
