import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:linearprogrammingapp/controllers/simplex_mode_controller.dart';
import 'package:linearprogrammingapp/models/simplex_data_model.dart';

import '../mocks.dart';

void main() {
  group('SimplexModeController', () {
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

    test('calculateSize 2Variables 3Constraints', () {
      final overrides = <Override>[
        entrySizeControllerProvider.overrideWith(MockSizeEntry2Var3Con.new),
      ];
      final container = createProviderContainer(overrides: overrides);
      // container.read(entrySizeControllerProvider.notifier).setVariables('2');
      // container.read(entrySizeControllerProvider.notifier).setConstraints('3');
      final result = container.read(calculateSizeProvider);
      expect(result.x, 4);
      expect(result.y, 6);
    });

    test('calculateSize 2Variables 7Constraints', () {
      final overrides = <Override>[
        entrySizeControllerProvider.overrideWith(MockSizeEntry3Var3Con.new),
      ];
      final container = createProviderContainer(overrides: overrides);
      final result = container.read(calculateSizeProvider);
      expect(result.x, 4);
      expect(result.y, 7);
    });

    test('toTabularForm 2Variables 3Constraints', () {
      final overrides = <Override>[
        calculateSizeProvider.overrideWithValue(const Point(4, 6)),
        dataEntryControllerProvider.overrideWith(MockDataMinimize2Var3Con.new),
      ];
      final container = createProviderContainer(overrides: overrides);
      final tableu = container.read(toTabularFormProvider);
      expect(
        tableu.$1,
        const TabularFormInformation(
          matrix: [
            [-1.1, -0.9, 0.0, 0.0, 1.0, -6.0],
            [0.3, 0.1, 1.0, 0.0, 0.0, 2.7],
            [0.5, 0.5, 0.0, 1.0, 0.0, 6.0],
            [0.6, 0.4, 0.0, 0.0, -1.0, 1.0],
          ],
          basicVariables: [3, 4, 6],
        ),
      );
      expect(tableu.$2, [3, 5]);
    });

    test('toTabularForm 2Variables 7Constraints', () {
      final overrides = <Override>[
        entrySizeControllerProvider.overrideWith(MockSizeEntry2Var7Con.new),
        dataEntryControllerProvider.overrideWith(MockDataMaximize2Var7Con.new),
      ];
      final container = createProviderContainer(overrides: overrides);
      final tableu = container.read(toTabularFormProvider);
      expect(
          tableu.$1,
          const TabularFormInformation(
            matrix: [
              [-12.0, -18.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, -101.0],
              [0.0, 1.0, -1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0],
              [0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 8.0],
              [1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7.0],
              [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 3.0],
              [9.0, 9.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 81.0],
              [6.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 60.0],
              [5.0, 7.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 1.0, 35.0]
            ],
            basicVariables: [4, 5, 6, 8, 9, 10, 12],
          ));
      expect(tableu.$2, [3, 7, 9, 11]);
    });

    test('simplexController max 2Var3Con', () {
      final overrides = <Override>[
        calculateSizeProvider.overrideWithValue(const Point(4, 6)),
        dataEntryControllerProvider.overrideWith(MockDataMaximize2Var3Con.new),
      ];
      final container = createProviderContainer(overrides: overrides);
      final simplexData = container.read(simplexControllerProvider.notifier).computeAnswer();
      expect(
        simplexData.pivotsCoordinates,
        [const Point<int>(0, 2), const Point<int>(1, 1)],
      );
      expect(
        simplexData.tableaus,
        [
          [
            ['Z', '-180', '-90', '0', '0', '0', '0'],
            ['x_3', '6', '8', '1', '0', '0', '48'],
            ['x_4', '1', '0', '0', '1', '0', '6'],
            ['x_5', '0', '1', '0', '0', '1', '4']
          ],
          [
            ['Z', '0', '-90', '0', '180', '0', '1080'],
            ['x_3', '0', '8', '1', '-6', '0', '12'],
            ['x_1', '1', '0', '0', '1', '0', '6'],
            ['x_5', '0', '1', '0', '0', '1', '4']
          ],
          [
            ['Z', '0', '0', '11.25', '112.5', '0', '1215'],
            ['x_2', '0', '1', '0.125', '-0.75', '0', '1.5'],
            ['x_1', '1', '0', '0', '1', '0', '6'],
            ['x_5', '0', '0', '-0.125', '0.75', '1', '2.5']
          ]
        ],
      );
    });
  });
}
