import 'dart:math';

import 'package:linearprogrammingapp/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/enums.dart';
import '../models/graphic_data_model.dart';
import 'data_entry_controller.dart';

part 'graphic_mode_controller.g.dart';

@riverpod
List<Point<double>> getIntersectionsOnAxes(GetIntersectionsOnAxesRef ref) {
  final constraints = ref.watch(dataEntryControllerProvider.select((value) => value.constraints));
  final List<Point<double>> intersections = [];
  for (int i = 0; i < constraints.length; i++) {
    final [x, y, ..., z] = constraints[i];
    final points = ref.read(getIntersectionOnAxisProvider(x, y, z));
    if (points.p1 != null) intersections.add(points.p1!);
    if (points.p2 != null) intersections.add(points.p2!);
  }
  return intersections;
}

@riverpod
NullablePoints getIntersectionOnAxis(GetIntersectionOnAxisRef ref, double x, double y, double z) {
  final Point<double>? p1 = x == 0 ? null : Point(z / x, 0);
  final Point<double>? p2 = y == 0 ? null : Point(0, z / y);
  return (p1: p1, p2: p2);
}

@riverpod
Point<double> getBiggestIntersectionsOnAxes(GetBiggestIntersectionsOnAxesRef ref) {
  final intersections = ref.watch(getIntersectionsOnAxesProvider);
  double maxX = 0, maxY = 0;
  for (final intersection in intersections) {
    if (intersection.x > maxX) maxX = intersection.x;
    if (intersection.y > maxY) maxY = intersection.y;
  }
  return Point<double>(maxX, maxY);
}

@riverpod
({double x, double y}) getLimitsRoundedOnMagnitude(GetLimitsRoundedOnMagnitudeRef ref) {
  final limits = ref.watch(getBiggestIntersectionsOnAxesProvider);
  return (x: limits.x.roundToNextMagnitude(), y: limits.y.roundToNextMagnitude());
}

@riverpod
List<PointPair> getIntersectionsOnConstraintsAndLimits(
  GetIntersectionsOnConstraintsAndLimitsRef ref,
) {
  final constraints = ref.watch(dataEntryControllerProvider.select((value) => value.constraints));
  final List<PointPair> lines = [];
  for (final eq in constraints) {
    final [x, y, ..., z] = eq;
    lines.add(ref.read(getIntersectionConstraintLimitProvider(x, y, z)));
  }
  return lines;
}

@riverpod
PointPair getIntersectionConstraintLimit(
  GetIntersectionConstraintLimitRef ref,
  double x,
  double y,
  double z,
) {
  final limits = ref.watch(getBiggestIntersectionsOnAxesProvider);
  //offset 1
  double p1x = x == 0 ? 0 : (z - (y * limits.y)) / x;
  if (p1x < 0) {
    p1x = 0;
  }
  double p1y = y == 0 ? 0 : (z - (p1x * x)) / y;
  //offset 2
  double p2y = y == 0 ? limits.y : (z - (x * limits.x)) / y;
  if (p2y < 0) {
    p2y = 0;
  }
  double p2x = x == 0 ? limits.x : (z - (p2y * y)) / x;
  return (p1: Point(p1x, p1y), p2: Point(p2x, p2y));
}

@riverpod
List<Point<double>> getIntersectionsBetweenCostraints(GetIntersectionsBetweenCostraintsRef ref) {
  final constraints = ref.watch(dataEntryControllerProvider.select((value) => value.constraints));
  final axesIntersections = ref.watch(getIntersectionsOnAxesProvider);
  final List<Point<double>> vertices = [];
  for (int i = 0; i < constraints.length - 1; i++) {
    final [a1, b1, ..., c1] = constraints[i];
    for (int j = i + 1; j < constraints.length; j++) {
      final [a2, b2, ..., c2] = constraints[j];
      final double determinant = a1 * b2 - a2 * b1;
      if (determinant != 0) {
        double x = (c1 * b2 - c2 * b1) / determinant;
        double y = (a1 * c2 - a2 * c1) / determinant;
        if (x >= 0 && y >= 0) {
          vertices.add(Point(x, y));
        }
      }
    }
  }
  vertices.addAll(axesIntersections);
  return vertices;
}

@riverpod
List<Point<double>> getIntersectionsOnAxesAndBetweenConstraints(
    GetIntersectionsOnAxesAndBetweenConstraintsRef ref) {
  final intersectionsBetweenCostraints = ref.watch(getIntersectionsBetweenCostraintsProvider);
  final intersectionsOnAxes = ref.watch(getIntersectionsOnAxesProvider);
  final Set<Point<double>> allIntersections = {};
  allIntersections.addAll(intersectionsBetweenCostraints);
  allIntersections.addAll(intersectionsOnAxes);
  return allIntersections.toList();
}

@riverpod
List<Point<double>> getCompliantIntersections(GetCompliantIntersectionsRef ref) {
  final constraints = ref.watch(dataEntryControllerProvider.select((value) => value.constraints));
  final operators = ref.watch(dataEntryControllerProvider.select((value) => value.operators));
  final intersections = ref.watch(getIntersectionsOnAxesAndBetweenConstraintsProvider);
  final limits = ref.watch(getBiggestIntersectionsOnAxesProvider);
  intersections.addAll([const Point(0, 0), Point(limits.x, limits.y)]);
  for (int i = 0; i < constraints.length; i++) {
    final [x, y, ..., z] = constraints[i];
    final operator = operators[i];
    for (int j = 0; j < intersections.length; j++) {
      final intersection = intersections[j];
      final result = x * intersection.x + y * intersection.y;
      switch (operator) {
        case Operators.geq:
          if (result < z) {
            intersections.removeAt(j);
            j--;
          }
          break;
        case Operators.leq:
          if (result > z) {
            intersections.removeAt(j);
            j--;
          }
          break;
        case Operators.equal:
          if (result != z) {
            intersections.removeAt(j);
            j--;
          }
          break;
        default:
          throw Exception('Invalid operator');
      }
    }
  }
  return intersections;
}

@riverpod
List<List<Point<double>>> getFeasibleMatrixPoints(GetFeasibleMatrixPointsRef ref) {
  final operators = ref.watch(dataEntryControllerProvider.select((value) => value.operators));
  final List<PointPair> restrictions = ref.watch(getIntersectionsOnConstraintsAndLimitsProvider);
  final limits = ref.watch(getBiggestIntersectionsOnAxesProvider);
  List<List<Point<double>>> pointsMatrix = [];
  for (final (i, restriction) in restrictions.indexed) {
    Set<Point<double>> points = {};
    final x1 = restriction.p1.x;
    final y1 = restriction.p1.y;
    final x2 = restriction.p2.x;
    final y2 = restriction.p2.y;
    points.addAll([
      Point(x1, y1),
      Point(x2, y2),
    ]);
    switch (operators[i]) {
      case Operators.geq:
        if (restriction.p1.x == restriction.p2.x) {
          points.addAll([
            Point(limits.x, y2),
            Point(limits.x, y1),
          ]);
        } else if (y1 == y2) {
          points.addAll([
            Point(x2, limits.y),
            Point(x1, limits.y),
          ]);
        } else {
          points.addAll([
            Point(limits.x, y2),
            Point(limits.x, limits.y),
            Point(x1, limits.y),
          ]);
        }
        break;
      case Operators.leq:
        if (x1 == x2) {
          points.addAll([
            Point(0, y2),
            Point(0, y1),
          ]);
        } else if (y1 == y2) {
          points.addAll([
            Point(x2, 0),
            Point(x1, 0),
          ]);
        } else {
          points.addAll([
            Point(0, y2),
            Point(0, y1),
          ]);
        }
        break;
      case Operators.equal:
        //no extra points needed.
        break;
      default:
    }
    pointsMatrix.add(points.toList());
  }
  return pointsMatrix;
}

@riverpod
Point<double> getOptimalAnswer(GetOptimalAnswerRef ref) {
  final [x1, x2, ...] =
      ref.watch(dataEntryControllerProvider.select((value) => value.objectiveFunction));
  final objective = ref.watch(dataEntryControllerProvider.select((value) => value.objective));
  final limits = ref.watch(getBiggestIntersectionsOnAxesProvider);
  final compliantIntersections = ref.watch(getCompliantIntersectionsProvider);
  Point<double> awswerPoint = const Point(0, 0);
  if (compliantIntersections.isEmpty) return awswerPoint;
  awswerPoint = compliantIntersections[0];
  double zAnswer = x1 * awswerPoint.x + x2 * awswerPoint.y;
  for (int i = 1; i < compliantIntersections.length; i++) {
    final compliantPoint = compliantIntersections[i];
    final double auxResult = x1 * compliantPoint.x + x2 * compliantPoint.y;
    switch (objective) {
      case Objectives.max:
        if (auxResult > zAnswer &&
            !(compliantPoint.x == limits.x && compliantPoint.y == limits.y)) {
          awswerPoint = compliantPoint;
          zAnswer = auxResult;
        }
        break;
      case Objectives.min:
        if (auxResult > 0 && auxResult < zAnswer) {
          awswerPoint = compliantPoint;
          zAnswer = auxResult;
        }
        break;
    }
  }
  return awswerPoint;
}

@riverpod
class GraphicController extends _$GraphicController {
  @override
  GraphicDataModel build() {
    final [x, y, ...] =
        ref.watch(dataEntryControllerProvider.select((value) => value.objectiveFunction));
    final roundedLimits = ref.watch(getLimitsRoundedOnMagnitudeProvider);
    final restrictions = ref.watch(getIntersectionsOnConstraintsAndLimitsProvider);
    final answerPoint = ref.watch(getOptimalAnswerProvider);
    final answerLine = ref
        .watch(getIntersectionConstraintLimitProvider(x, y, x * answerPoint.x + y * answerPoint.y));
    final feasibleRegion = ref.watch(getFeasibleMatrixPointsProvider);
    final compliantIntersections = ref.watch(getCompliantIntersectionsProvider);
    return GraphicDataModel(
      xLimit: roundedLimits.x,
      yLimit: roundedLimits.y,
      answer: answerPoint,
      objectiveFunctionIntersections: answerLine,
      restrictions: restrictions,
      feasibleRegionMatrixPoints: feasibleRegion,
      compliantIntersections: compliantIntersections,
    );
  }
}
