

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../custom_painters/plot_painter.dart';

class GraphicProcessPage extends ConsumerWidget {
  const GraphicProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Programming App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(child: Text('GraphicProcessPage', textAlign: TextAlign.center, style: textTheme.displaySmall)),
          Expanded(
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: CustomPaint(
                painter: PlotPainter(
                  theme: theme,
                  limitX: 0.02,
                  limitY: 9.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
