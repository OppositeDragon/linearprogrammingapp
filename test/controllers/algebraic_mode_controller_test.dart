import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linearprogrammingapp/controllers/algebraic_mode_controller.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';

import '../mocks.dart';

void main() {
  group('AlgebraicModeController', () {
    ProviderContainer createProviderContainer({
      ProviderContainer? parent,
      List<Override> overrides = const [],
      List<ProviderObserver>? observers,
    }) {
      final container = ProviderContainer(
        parent: parent,
        overrides: overrides,
        observers: observers,
      );
      addTearDown(container.dispose);
      return container;
    }

    test('toStandardForm maximize', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMaximize2Var7Con.new),
      ];
      final container = createProviderContainer(overrides: overrides);
      final algebraicData = container.read(algebraicControllerProvider.notifier).toStandardForm();
      expect(algebraicData.standardForm, [
        [0.0, 1.0, -1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0],
        [0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 8.0],
        [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 7.0],
        [1.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 3.0],
        [9.0, 9.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 81.0],
        [6.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 60.0],
        [5.0, 7.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 35.0]
      ]);
      expect(algebraicData.constraintWithSlack, [
        [0.0, 1.0, -1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        [0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0],
        [1.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0],
        [9.0, 9.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0],
        [6.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0],
        [5.0, 7.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0]
      ]);
      expect(algebraicData.rightSide, [3.0, 8.0, 7.0, 3.0, 81.0, 60.0, 35.0]);
      expect(algebraicData.rightSideString, ['\\;3', '\\;8', '\\;7', '\\;3', '\\;81', '\\;60', '\\;35']);
      expect(algebraicData.constraintsString, [
        ['\\;', '\\;', '+x_{1}', '+x_{1}', '+9x_{1}', '+6x_{1}', '+5x_{1}'],
        ['+x_{2}', '+x_{2}', '\\;', '\\;', '+9x_{2}', '+10x_{2}', '+7x_{2}'],
        ['-x_{3}', '\\;', '\\;', '\\;', '\\;', '\\;', '\\;'],
        ['\\;', '+x_{4}', '\\;', '\\;', '\\;', '\\;', '\\;'],
        ['\\;', '\\;', '+x_{5}', '\\;', '\\;', '\\;', '\\;'],
        ['\\;', '\\;', '\\;', '-x_{6}', '\\;', '\\;', '\\;'],
        ['\\;', '\\;', '\\;', '\\;', '+x_{7}', '\\;', '\\;'],
        ['\\;', '\\;', '\\;', '\\;', '\\;', '+x_{8}', '\\;'],
        ['\\;', '\\;', '\\;', '\\;', '\\;', '\\;', '-x_{9}'],
        ['\\;=', '\\;=', '\\;=', '\\;=', '\\;=', '\\;=', '\\;=']
      ]);
      expect(algebraicData.combinationsEquation, 'C(n,r) = \\frac{0!}{0!(0-0)!} = 1');
    });

    test('toStandardForm minimize', () {
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMinimize2Var3Con.new)];
      final container = createProviderContainer(overrides: overrides);
      final algebraicData = container.read(algebraicControllerProvider.notifier).toStandardForm();
      expect(algebraicData.standardForm, [
        [0.3, 0.1, 1.0, 0.0, 0.0, 2.7],
        [0.5, 0.5, 0.0, 1.0, 0.0, 6.0],
        [0.6, 0.4, 0.0, 0.0, -1.0, 6.0],
      ]);
      expect(algebraicData.constraintWithSlack, [
        [0.3, 0.1, 1.0, 0.0, 0.0],
        [0.5, 0.5, 0.0, 1.0, 0.0],
        [0.6, 0.4, 0.0, 0.0, -1.0]
      ]);
      expect(algebraicData.rightSide, [2.7, 6, 6]);
      expect(algebraicData.rightSideString, ['\\;2.7', '\\;6', '\\;6']);
      expect(algebraicData.constraintsString, [
        ['+0.3x_{1}', '+0.5x_{1}', '+0.6x_{1}'],
        ['+0.1x_{2}', '+0.5x_{2}', '+0.4x_{2}'],
        ['+x_{3}', '\\;', '\\;'],
        ['\\;', '+x_{4}', '\\;'],
        ['\\;', '\\;', '-x_{5}'],
        ['\\;=', '\\;=', '\\;='],
      ]);
      expect(algebraicData.combinationsEquation, 'C(n,r) = \\frac{0!}{0!(0-0)!} = 1');
    });

    test('answerAlgebraic minimize', () {
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMinimize2Var3Con.new)];
      final container = createProviderContainer(overrides: overrides);
      final answerAlgebraic = container.read(algebraicControllerProvider.notifier).answerAlgebraic(
        [
          [0.3, 0.1, 1.0, 0.0, 0.0],
          [0.5, 0.5, 0.0, 1.0, 0.0],
          [0.6, 0.4, 0.0, 0.0, -1.0]
        ],
        [2.7, 6, 6],
      );
      expect(answerAlgebraic.definitiveSolution, 4.7);
      expect(answerAlgebraic.finalSolutionString, 'Z=0.4 (8) + 0.5 (3) = 4.7');
      expect(answerAlgebraic.step, 9);
    });
  });
}
