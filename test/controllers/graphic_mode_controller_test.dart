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
      addTearDown(container.dispose);
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
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMaximize.new)];
      final container = createProviderContainer(overrides: overrides);
      final getIntersectionsOnAxes = container.read(getItersectionsOnAxesProvider);
      expect(getIntersectionsOnAxes, const [
        Point<double>(0.0, 3.0),
        Point<double>(0.0, 8.0),
        Point<double>(7.0, 0.0),
        Point<double>(3.0, 0.0),
        Point<double>(9.0, 0.0),
        Point<double>(0.0, 9.0),
        Point<double>(10.0, 0.0),
        Point<double>(0.0, 6.0),
        Point<double>(0.0, 5.0)
      ]);
    });

    test('getBiggestIntersectionsOnAxes', () {
      final overrides = <Override>[
        getItersectionsOnAxesProvider.overrideWithValue(
          <Point<double>>[
            const Point<double>(0.0, 3.0),
            const Point<double>(0.0, 8.0),
            const Point<double>(7.0, 0.0),
            const Point<double>(3.0, 0.0),
            const Point<double>(9.0, 0.0),
            const Point<double>(0.0, 9.0),
            const Point<double>(10.0, 0.0),
            const Point<double>(0.0, 6.0),
            const Point<double>(0.0, 5.0)
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getBiggestIntersectionsOnAxes = container.read(getBiggestIntersectionsOnAxesProvider);
      expect(getBiggestIntersectionsOnAxes, const Point<double>(10, 9));
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

    test('getLimitsRoundedOnMagnitude where x=10 and y=9', () {
      final overrides = <Override>[
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point(10, 9),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getLimitsRoundedOnMagnitude = container.read(getLimitsRoundedOnMagnitudeProvider);
      expect(getLimitsRoundedOnMagnitude, (x: 10, y: 9));
    });

    test('getLimitsRoundedOnMagnitude where x=10321.27 and y=8321.451', () {
      final overrides = <Override>[
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point(10321.27, 8321.451),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getLimitsRoundedOnMagnitude = container.read(getLimitsRoundedOnMagnitudeProvider);
      expect(getLimitsRoundedOnMagnitude, (x: 11000.0, y: 8400.0));
    });

    test('getIntersectionsOnConstraintsAndLimits', () {
      final overrides = <Override>[dataEntryControllerProvider.overrideWith(MockDataMaximize.new)];
      final container = createProviderContainer(overrides: overrides);
      final getIntersectionsOnConstraintsAndLimits =
          container.read(getIntersectionsOnConstraintsAndLimitsProvider);
      expect(
        getIntersectionsOnConstraintsAndLimits,
        const [
          (p1: Point<double>(0.0, 3.0), p2: Point<double>(10.0, 3.0)),
          (p1: Point<double>(0.0, 8.0), p2: Point<double>(10.0, 8.0)),
          (p1: Point<double>(7.0, 0.0), p2: Point<double>(7.0, 9.0)),
          (p1: Point<double>(3.0, 0.0), p2: Point<double>(3.0, 9.0)),
          (p1: Point<double>(0.0, 9.0), p2: Point<double>(9.0, 0.0)),
          (p1: Point<double>(0.0, 6.0), p2: Point<double>(10.0, 0.0)),
          (p1: Point<double>(0.0, 5.0), p2: Point<double>(7.0, 0.0)),
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

    test('getCompliantIntersections maximize', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMaximize.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(10, 9),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getCompliantIntersections = container.read(getCompliantIntersectionsProvider);
      expect(getCompliantIntersections, const [
        Point<double>(5.0, 3.0),
        Point<double>(3.0, 4.2),
      ]);
    });


    test('getCompliantIntersections minimize', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMinimize.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(80, 50),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getCompliantIntersections = container.read(getCompliantIntersectionsProvider);
      expect(
        getCompliantIntersections,
        const [
          Point<double>(36.36363636363637, 10.909090909090908),
          Point<double>(11.538461538461538, 30.76923076923077),
          Point<double>(80.0, 0.0),
          Point<double>(0.0, 50.0),
          Point<double>(80.0, 50.0),
        ],
      );
    });

    test('getFeasibleMatrixPoints', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMaximize.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(6, 8),
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getFeasibleMatrixPoints = container.read(getFeasibleMatrixPointsProvider);
      expect(getFeasibleMatrixPoints, const [
        [
          Point<double>(0.0, 3.0),
          Point<double>(6.0, 3.0),
          Point<double>(6.0, 8.0),
          Point<double>(0.0, 8.0),
        ],
        [
          Point<double>(0.0, 8.0),
          Point<double>(6.0, 8.0),
          Point<double>(6.0, 0.0),
          Point<double>(0.0, 0.0),
        ],
        [
          Point<double>(7.0, 0.0),
          Point<double>(7.0, 8.0),
          Point<double>(0.0, 8.0),
          Point<double>(0.0, 0.0),
        ],
        [
          Point<double>(3.0, 0.0),
          Point<double>(3.0, 8.0),
          Point<double>(6.0, 8.0),
          Point<double>(6.0, 0.0),
        ],
        [
          Point<double>(1.0, 8.0),
          Point<double>(6.0, 3.0),
          Point<double>(0.0, 3.0),
          Point<double>(0.0, 8.0),
        ],
        [
          Point<double>(0.0, 6.0),
          Point<double>(6.0, 2.4),
        ],
        [
          Point<double>(0.0, 5.0),
          Point<double>(6.0, 0.7142857142857143),
          Point<double>(6.0, 8.0),
          Point<double>(0.0, 8.0),
        ]
      ]);
    });

    test('getOptimalAnswer maximize', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMaximize.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(10, 9),
        ),
        getCompliantIntersectionsProvider.overrideWithValue(
          const [
            Point<double>(5.0, 3.0),
            Point<double>(3.0, 4.2),
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getOptimalAnswer = container.read(getOptimalAnswerProvider);
      expect(getOptimalAnswer, const Point<double>(5, 3));
    });

    test('getOptimalAnswer minimize', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMinimize.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(80, 50),
        ),
        getCompliantIntersectionsProvider.overrideWithValue(
          const [
            Point<double>(36.36363636363637, 10.909090909090908),
            Point<double>(11.538461538461538, 30.76923076923077),
            Point<double>(80.0, 0.0),
            Point<double>(0.0, 50.0),
            Point<double>(80.0, 50.0),
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final getOptimalAnswer = container.read(getOptimalAnswerProvider);
      expect(getOptimalAnswer, const Point<double>(400 / 11, 120 / 11));
    });

    test('GraphicController', () {
      final overrides = <Override>[
        dataEntryControllerProvider.overrideWith(MockDataMaximize.new),
        getBiggestIntersectionsOnAxesProvider.overrideWithValue(
          const Point<double>(10, 9),
        ),
        getLimitsRoundedOnMagnitudeProvider.overrideWithValue(
          (x: 10, y: 9),
        ),
        getIntersectionsOnConstraintsAndLimitsProvider.overrideWithValue(const [
          (p1: Point<double>(0.0, 3.0), p2: Point<double>(10.0, 3.0)),
          (p1: Point<double>(0.0, 8.0), p2: Point<double>(10.0, 8.0)),
          (p1: Point<double>(7.0, 0.0), p2: Point<double>(7.0, 9.0)),
          (p1: Point<double>(3.0, 0.0), p2: Point<double>(3.0, 9.0)),
          (p1: Point<double>(0.0, 9.0), p2: Point<double>(9.0, 0.0)),
          (p1: Point<double>(0.0, 6.0), p2: Point<double>(10.0, 0.0)),
          (p1: Point<double>(0.0, 5.0), p2: Point<double>(7.0, 0.0)),
        ]),
        getOptimalAnswerProvider.overrideWithValue(
          const Point<double>(5, 3),
        ),
        getCompliantIntersectionsProvider.overrideWithValue(
          const [
            Point<double>(5.0, 3.0),
            Point<double>(3.0, 4.2),
          ],
        ),
      ];
      final container = createProviderContainer(overrides: overrides);
      final graphicController = container.read(graphicControllerProvider);
      expect(
          graphicController,
          const GraphicDataModel(
              xLimit: 10.0,
              yLimit: 9.0,
              answer: Point(5.0, 3.0),
              answerObjectiveFunction: (p1: Point(2.0, 9.0), p2: Point(6.5, 0.0)),
              restrictions: [
                (p1: Point(0.0, 3.0), p2: Point(10.0, 3.0)),
                (p1: Point(0.0, 8.0), p2: Point(10.0, 8.0)),
                (p1: Point(7.0, 0.0), p2: Point(7.0, 9.0)),
                (p1: Point(3.0, 0.0), p2: Point(3.0, 9.0)),
                (p1: Point(0.0, 9.0), p2: Point(9.0, 0.0)),
                (p1: Point(0.0, 6.0), p2: Point(10.0, 0.0)),
                (p1: Point(0.0, 5.0), p2: Point(7.0, 0.0))
              ],
              feasibleRegionMatrixPoints: [
                [Point(0.0, 3.0), Point(10.0, 3.0), Point(10.0, 9.0), Point(0.0, 9.0)],
                [Point(0.0, 8.0), Point(10.0, 8.0), Point(10.0, 0.0), Point(0.0, 0.0)],
                [Point(7.0, 0.0), Point(7.0, 9.0), Point(0.0, 9.0), Point(0.0, 0.0)],
                [Point(3.0, 0.0), Point(3.0, 9.0), Point(10.0, 9.0), Point(10.0, 0.0)],
                [Point(0.0, 9.0), Point(9.0, 0.0), Point(0.0, 0.0)],
                [Point(0.0, 6.0), Point(10.0, 0.0)],
                [
                  Point(0.0, 5.0),
                  Point(7.0, 0.0),
                  Point(10.0, 0.0),
                  Point(10.0, 9.0),
                  Point(0.0, 9.0)
                ]
              ],
              feasibleRegionText: 'feasible\nregion'));
    });
    //end
  });
}
