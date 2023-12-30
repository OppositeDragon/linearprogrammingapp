import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:linearprogrammingapp/utils/extensions.dart';

import '../constants/numeric.dart';
import '../models/simplex_data_model.dart';

class AnswerPresentation extends StatelessWidget {
  const AnswerPresentation({
    required this.answerPresentation,
    super.key,
  });
  final AnswerPresentationModel answerPresentation;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textSpans = <InlineSpan>[];
    final zPans = <InlineSpan>[];
    for (int i = 0; i < answerPresentation.variablesData.length; i++) {
      final variableData = answerPresentation.variablesData[i];
      textSpans.add(
        WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: spaceS),
            child: Transform.translate(
              offset: const Offset(0, -5),
              child: Math.tex(
                'x_{${variableData.letter}}=${variableData.value.toStringAsFixed(3).deleteLastZero()}',
                textStyle: textTheme.headlineMedium,
                mathStyle: MathStyle.display,
              ),
            ),
          ),
        ),
      );
      if (i != answerPresentation.variablesData.length - 1) {
        textSpans.add(
          const TextSpan(text: ', '),
        );
      }
    }
    for (final (i, variableData) in answerPresentation.variablesData.indexed) {
      zPans.add(
        TextSpan(
          text: '${variableData.coefficient}(${variableData.value.toStringAsFixed(3).deleteLastZero()})',
          style: textTheme.headlineSmall!.copyWith(fontFamily: 'CMRomanSerif'),
        ),
      );
      if (i == answerPresentation.variablesData.length - 1) {
        zPans.add(
          TextSpan(
            text: ' = ',
            style: textTheme.headlineSmall!.copyWith(fontFamily: 'CMRomanSerif'),
          ),
        );
      } else {
        zPans.add(
          TextSpan(
            text: ' + ',
            style: textTheme.headlineSmall!.copyWith(fontFamily: 'CMRomanSerif'),
          ),
        );
      }
    }
    return Center(
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'La solución óptima se encuentra en los puntos ',
              style: textTheme.headlineMedium!.copyWith(fontFamily: 'CMRomanSerif'),
              children: [
                ...textSpans,
                const TextSpan(text: '; Así: '),
              ],
            ),
          ),
          const SizedBox(height: spaceXL),
          FittedBox(
            child: RichText(
              text: TextSpan(
                text: 'Z = ',
                style: textTheme.headlineMedium!.copyWith(fontFamily: 'CMClassic'),
                children: [
                  ...zPans,
                  TextSpan(
                    text: answerPresentation.z.toStringAsFixed(3).deleteLastZero(),
                    style: textTheme.headlineSmall!.copyWith(fontFamily: 'CMRomanSerif'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
