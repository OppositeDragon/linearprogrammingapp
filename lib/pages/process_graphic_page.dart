import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';

import '../custom_painters/plot_painter.dart';

class GraphicProcessPage extends ConsumerWidget {
  const GraphicProcessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    final dataEntryModel = ref.watch(dataEntryControllerProvider);
    print(dataEntryModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Programming App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text('Metodo Gráfico', textAlign: TextAlign.center, style: textTheme.displaySmall),
          ),
          Expanded(
						
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(spaceM),
                child: CustomPaint(
                  painter: PlotPainter(
                    theme: theme,
                    constraints: dataEntryModel.constraints,
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
