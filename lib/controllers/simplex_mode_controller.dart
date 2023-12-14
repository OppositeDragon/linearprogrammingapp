import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/enums.dart';
import '../models/data_entry_model.dart';
import '../models/simplex_data_model.dart';
import 'data_entry_controller.dart';

part 'simplex_mode_controller.g.dart';

typedef TableuSize = ({int rows, int columns});

@riverpod
Point<int> calculateSize(CalculateSizeRef ref) {
  final EntrySizeState entrySize = ref.watch(entrySizeControllerProvider);
  final int rows = entrySize.constraints + 1;
  final int columns = entrySize.variables + entrySize.constraints + 1;
  return Point(rows, columns);
}

@riverpod
List<List<double>> toTabularForm(ToTabularFormRef ref) {
  final tableuSize = ref.watch(calculateSizeProvider);
  final dataEntry = ref.watch(dataEntryControllerProvider);
  final tableu = List.generate(tableuSize.x, (index) => List.generate(tableuSize.y, (index) => 0.0));
  //fills the first row with the objective function
  for (var i = 0; i < dataEntry.objectiveFunction.length; i++) {
    tableu[0][i] = -dataEntry.objectiveFunction[i];
  }
  //fills the contraints after the first column
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    for (var j = 0; j < dataEntry.constraints[i].length - 1; j++) {
      tableu[i + 1][j] = dataEntry.constraints[i][j];
    }
  }
  //fills the last column with the right side of the constraints
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    tableu[i + 1].last = dataEntry.constraints[i].last;
  }
  //fills the slack variables
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    tableu[i + 1][dataEntry.constraints.first.length + i - 1] = dataEntry.operators[i] == Operators.leq ? 1 : -1;
  }
  // debugPrint('tableuSize: $tableuSize');
  // debugPrint('tableu: $tableu');
  return tableu;
}

@riverpod
class SimplexController extends _$SimplexController {
  List<List<List<double>>> _followingTableus = [];
  final List<Point<int>> _pivotsCoordinates = [];
  List<List<List<double>>> get tableus => _followingTableus;
  List<Point<int>> get pivotsCoordinates => _pivotsCoordinates;
  @override
  void build() {
    _followingTableus = [ref.watch(toTabularFormProvider)];
  }

  SimplexDataModel getAnswer() {
    SimplexStatus status = SimplexStatus.notOptimal;
    int i = 0;
    while (!(status == SimplexStatus.optimal || status == SimplexStatus.unbounded)) {
      status = _compute();
      debugPrint('i: ${++i}\t status: $status');
    }
    debugPrint('out of while loop');
    return SimplexDataModel(
      tableus: tableus,
      pivotsCoordinates: pivotsCoordinates,
      status: status,
    );
  }

  SimplexStatus _compute() {
    //step 1 - check optimality
    if (isOptimal()) {
      debugPrint('isOptimal');
      return SimplexStatus.optimal;
    }
    //step 2 - find pivot coordinates
    final Point<int> pivotCoordinates = findPivotCoordinates(_followingTableus.last);
    debugPrint('pivotCoordinates: $pivotCoordinates');
    if (pivotCoordinates == const Point<int>(-1, -1)) return SimplexStatus.unbounded;
    //step 3 - form next tableu
    formNextTableu(pivotCoordinates);
    return SimplexStatus.notOptimal;
  }

  bool isOptimal() {
    return _followingTableus.last.first.every((element) => element >= 0);
  }

  Point<int> findPivotCoordinates(List<List<double>> tableu) {
    // final tableu = ref.watch(toTabularFormProvider);
    final smallestColumnPosition = tableu[0].indexOf(tableu[0].reduce(min));
    int smallestRowPosition = -1;
    double smallestresult = -1;
    for (var i = 0; i < tableu.length; i++) {
      final double value = tableu[i][smallestColumnPosition];
      if (value > 0) {
        final result = tableu[i].last / value;
        debugPrint('result: ${tableu[i].last}/$value = $result');
        if (result < smallestresult || smallestresult == -1) {
          smallestresult = result;
          smallestRowPosition = i;
        }
      }
    }
    debugPrint('smallestColumnPosition: $smallestColumnPosition; smallestRowPosition: $smallestRowPosition');
    if (smallestresult <= 0) return const Point<int>(-1, -1);
    _pivotsCoordinates.add(Point<int>(smallestColumnPosition, smallestRowPosition));
    return _pivotsCoordinates.last;
  }

  List<List<double>> formNextTableu(Point<int> pivotCoordinates) {
    final List<List<double>> currentTableu = _followingTableus.last;
    final List<List<double>> nextTableu = List.generate(
      currentTableu.length,
      (index) => List.generate(currentTableu[index].length, (index) => 0.0),
    );
    final double pivotValue = currentTableu[pivotCoordinates.y][pivotCoordinates.x];
    //fills the pivot row
    for (var i = 0; i < currentTableu[pivotCoordinates.y].length; i++) {
      nextTableu[pivotCoordinates.y][i] = currentTableu[pivotCoordinates.y][i] / pivotValue;
    }
    //fills the pivot column
    for (var i = 0; i < currentTableu.length; i++) {
      if (i != pivotCoordinates.y) {
        final double pivotColumnValue = currentTableu[i][pivotCoordinates.x];
        for (var j = 0; j < currentTableu[i].length; j++) {
          nextTableu[i][j] = currentTableu[i][j] - pivotColumnValue * nextTableu[pivotCoordinates.y][j];
        }
      }
    }
    _followingTableus.add(nextTableu);
    debugPrint('nextTableu: $nextTableu');
    return nextTableu;
  }
}
