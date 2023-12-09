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
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMaximize.new)];
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
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMinimize.new)];
      final container = createProviderContainer(overrides: overrides);
      final algebraicData = container.read(algebraicControllerProvider.notifier).toStandardForm();
      expect(algebraicData.standardForm, [
        [4.0, 5.0, -1.0, 0.0, 0.0, 200.0],
        [2.0, 8.0, 0.0, -1.0, 0.0, 160.0],
        [5.0, 3.0, 0.0, 0.0, -1.0, 150.0]
      ]);
      expect(algebraicData.constraintWithSlack, [
        [4.0, 5.0, -1.0, 0.0, 0.0],
        [2.0, 8.0, 0.0, -1.0, 0.0],
        [5.0, 3.0, 0.0, 0.0, -1.0]
      ]);
      expect(algebraicData.rightSide, [200.0, 160.0, 150.0]);
      expect(algebraicData.rightSideString, ['\\;200', '\\;160', '\\;150']);
      expect(algebraicData.constraintsString, [
        ['+4x_{1}', '+2x_{1}', '+5x_{1}'],
        ['+5x_{2}', '+8x_{2}', '+3x_{2}'],
        ['-x_{3}', '\\;', '\\;'],
        ['\\;', '-x_{4}', '\\;'],
        ['\\;', '\\;', '-x_{5}'],
        ['\\;=', '\\;=', '\\;=']
      ]);
      expect(algebraicData.combinationsEquation, 'C(n,r) = \\frac{0!}{0!(0-0)!} = 1');
    });

    test('answerAlgebraic minimize', () {
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMinimize.new)];
      final container = createProviderContainer(overrides: overrides);
      final answerAlgebraic = container.read(algebraicControllerProvider.notifier).answerAlgebraic(
        [
          [4.0, 5.0, -1.0, 0.0, 0.0],
          [2.0, 8.0, 0.0, -1.0, 0.0],
          [5.0, 3.0, 0.0, 0.0, -1.0]
        ],
        [200.0, 160.0, 150.0],
      );
      expect(answerAlgebraic.definitiveSolution, 16363.636363636364);
      expect(answerAlgebraic.finalSolutionString, 'Z=300 (36.364) + 500 (10.909) = 16363.636');
      expect(answerAlgebraic.step, 8);
    });
  });
}
