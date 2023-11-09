import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:linearprogrammingapp/controllers/graphic_mode_controller.dart';
import 'package:linearprogrammingapp/models/graphic_data_model.dart';

import '../mocks.dart';

void main() {
  group('GraphicModeController', () {
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
      addTearDown(() => container.dispose());
      return container;
    }

    test('getIntersectiononAxis p1 and p2 are not null', () {
      final container = createProviderContainer();
      final getIntersectionOnAxis = container.read(getIntersectionOnAxisProvider(6, 8, 48));
      expect(getIntersectionOnAxis.p1, const Point<double>(48 / 6, 0));
      expect(getIntersectionOnAxis.p2, const Point<double>(0, 48 / 8));
    });

    test('getIntersectiononAxis p1 is null', () {
      final container = createProviderContainer();
      final getIntersectionOnAxis = container.read(getIntersectionOnAxisProvider(0, 1, 4));
      expect(getIntersectionOnAxis.p1, null);
      expect(getIntersectionOnAxis.p2, const Point<double>(0, 4 / 1));
    });

    test('getIntersectiononAxis p2 is null', () {
      final container = createProviderContainer();
      final getIntersectionOnAxis = container.read(getIntersectionOnAxisProvider(1, 0, 6));
      expect(getIntersectionOnAxis.p1, const Point<double>(6 / 1, 0));
      expect(getIntersectionOnAxis.p2, null);
    });

    test('getItersectionsOnAxes', () {
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMax.new)];
      final container = createProviderContainer(overrides: overrides);
      final getIntersectionsOnAxes = container.read(getItersectionsOnAxesProvider);
      expect(getIntersectionsOnAxes, const [
        Point<double>(8.0, 0.0),
        Point<double>(0.0, 6.0),
        Point<double>(6.0, 0.0),
        Point<double>(0.0, 4.0)
      ]);
    });

    test('getBiggestIntersectionsOnAxes', () {
      final overrides = <Override>[
        getItersectionsOnAxesProvider.overrideWithValue(
          <Point<double>>[
            const Point<double>(2, 8),
            const Point<double>(4, 5),
            const Point<double>(6, 3),
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getBiggestIntersectionsOnAxes = container.read(getBiggestIntersectionsOnAxesProvider);
      expect(getBiggestIntersectionsOnAxes, const Point<double>(6, 8));
    });

    test('getLimitsRoundedOnMagnitude where x=8 and y=6', () {
      final overrides = <Override>[
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point(8, 6),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getLimitsRoundedOnMagnitude = container.read(getLimitsRoundedOnMagnitudeProvider);
      expect(getLimitsRoundedOnMagnitude, (x: 8.0, y: 6.0));
    });

    test('getLimitsRoundedOnMagnitude where x=0.127 and y=6.69', () {
      final overrides = <Override>[
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point(0.127, 6.69),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getLimitsRoundedOnMagnitude = container.read(getLimitsRoundedOnMagnitudeProvider);
      expect(getLimitsRoundedOnMagnitude, (x: 0.2, y: 6.7));
    });

    test('getIntersectionsOnConstraintsAndLimits', () {
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMax.new)];
      final container = createProviderContainer(overrides: overrides);
      final getIntersectionsOnConstraintsAndLimits =
          container.read(getIntersectionsOnConstraintsAndLimitsProvider);
      expect(
        getIntersectionsOnConstraintsAndLimits,
        const [
          (p1: Point(0.0, 6.0), p2: Point(8.0, 0.0)),
          (p1: Point(6.0, 0.0), p2: Point(6.0, 6.0)),
          (p1: Point(0.0, 4.0), p2: Point(8.0, 4.0)),
        ],
      );
    });

    test('getIntersectionConstraintLimit', () {
      final overrides = <Override>[
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(6, 8),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getIntersectionConstraintLimit =
          container.read(getIntersectionConstraintLimitProvider(6, 8, 48));
      expect(getIntersectionConstraintLimit.p1, const Point<double>(0, 6));
      expect(getIntersectionConstraintLimit.p2, const Point<double>(6, 1.5));
    });

    test('getIntersectionsBetweenCostraints', () {
      final overrides = <Override>[
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(6, 8),
        ),
        getItersectionsOnAxesProvider.overrideWithValue(
          const [
            Point<double>(8.0, 0.0),
            Point<double>(0.0, 6.0),
            Point<double>(6.0, 0.0),
            Point<double>(0.0, 4.0)
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getIntersectionsBetweenCostraints =
          container.read(getIntersectionsBetweenCostraintsProvider);
      expect(
        getIntersectionsBetweenCostraints,
        const [
          Point(8.0, 0.0),
          Point(0.0, 6.0),
          Point(6.0, 0.0),
          Point(0.0, 4.0),
        ],
      );
    });

    test('getIntersectionsOnAxesAndBetweenConstraints', () {
      final overrides = <Override>[
        getIntersectionsBetweenCostraintsProvider.overrideWithValue(const [
          Point(0, 4),
          Point(6.0, 0.0),
          Point(6, 1.5),
          Point(8 / 3, 4),
        ]),
        getItersectionsOnAxesProvider.overrideWithValue(const [
          Point<double>(8.0, 0.0),
          Point<double>(0.0, 6.0),
          Point<double>(6.0, 0.0),
          Point<double>(0.0, 4.0)
        ]),
      ];
      final container = createProviderContainer(overrides: overrides);
      final intersectionsAxesConstraints =
          container.read(getIntersectionsOnAxesAndConstraintsProvider);
      expect(
          intersectionsAxesConstraints,
          //checks that no duplicates are present
          {
            const Point<double>(0.0, 4.0),
            const Point<double>(6.0, 0.0),
            const Point<double>(6.0, 1.5),
            const Point<double>(8 / 3, 4.0),
            const Point<double>(8.0, 0.0),
            const Point<double>(0.0, 6.0)
          }.toList());
    });

    test('getCompliantIntersections', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMax.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(6, 8),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getCompliantIntersections = container.read(getCompliantIntersectionsProvider);
      expect(getCompliantIntersections, const [
        Point<double>(8 / 3, 4.0),
        Point<double>(6.0, 4.0),
      ]);
    });

    test('getFeasibleMatrixPoints', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMax.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(6, 8),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getFeasibleMatrixPoints = container.read(getFeasibleMatrixPointsProvider);
      expect(getFeasibleMatrixPoints, const [
        [
          Point<double>(0.0, 6.0),
          Point<double>(6.0, 1.5),
          Point<double>(6.0, 8.0),
          Point<double>(0.0, 8.0),
        ],
        [
          Point<double>(6.0, 0.0),
          Point<double>(6.0, 8.0),
          Point<double>(0.0, 8.0),
          Point<double>(0.0, 0.0),
        ],
        [
          Point<double>(0.0, 4.0),
          Point<double>(6.0, 4.0),
        ],
      ]);
    });

    test('getOptimalAnswer', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMax.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(6, 8),
        ),
        getCompliantIntersectionsProvider.overrideWithValue(
          const [
            Point<double>(8 / 3, 4.0),
            Point<double>(6.0, 4.0),
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getOptimalAnswer = container.read(getOptimalAnswerProvider);
      expect(getOptimalAnswer, const Point<double>(6.0, 4.0));
    });

    test('GraphicController', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMax.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(6, 8),
        ),
        getLimitsRoundedOnMagnitudeProvider.overrideWithValue(
          (x: 6.0, y: 8.0),
        ),
        getIntersectionsOnConstraintsAndLimitsProvider.overrideWithValue(const [
          (p1: Point(0.0, 6.0), p2: Point(8.0, 0.0)),
          (p1: Point(6.0, 0.0), p2: Point(6.0, 6.0)),
          (p1: Point(0.0, 4.0), p2: Point(8.0, 4.0)),
        ]),
        getOptimalAnswerProvider.overrideWithValue(
          const Point<double>(6.0, 4.0),
        ),
        getCompliantIntersectionsProvider.overrideWithValue(
          const [
            Point<double>(8 / 3, 4.0),
            Point<double>(6.0, 4.0),
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final graphicController = container.read(graphicControllerProvider);
      expect(
          graphicController,
          const GraphicDataModel(
              xLimit: 6.0,
              yLimit: 8.0,
              answer: Point(6.0, 4.0),
              answerObjectiveFunction: (
                p1: Point(4.0, 8.0),
                p2: Point(6.0, 4.0),
              ),
              restrictions: [
                (p1: Point(0.0, 6.0), p2: Point(8.0, 0.0)),
                (p1: Point(6.0, 0.0), p2: Point(6.0, 6.0)),
                (p1: Point(0.0, 4.0), p2: Point(8.0, 4.0)),
              ],
              feasibleRegionMatrixPoints: [
                [
                  Point(0.0, 6.0),
                  Point(8.0, 0.0),
                  Point(6.0, 0.0),
                  Point(6.0, 8.0),
                  Point(0.0, 8.0),
                ],
                [
                  Point(6.0, 0.0),
                  Point(6.0, 6.0),
                  Point(0.0, 6.0),
                  Point(0.0, 0.0),
                ],
                [
                  Point(0.0, 4.0),
                  Point(8.0, 4.0),
                ]
              ],
              feasibleRegionText: 'feasible\nregion'));
    });
    //end
  });
}
