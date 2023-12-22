import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:linearprogrammingapp/utils/extensions.dart';
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
  final DataEntryState dataEntry = ref.watch(dataEntryControllerProvider);
  final int rows = entrySize.constraints + 1;
  int extraColumns = 0;
  for (var i = 0; i < dataEntry.operators.length; i++) {
    if (dataEntry.operators[i] == Operators.geq) extraColumns++;
  }
  final int columns = entrySize.variables + entrySize.constraints + extraColumns + 1;
  return Point<int>(rows, columns);
}

@riverpod
(TabularFormInformation, List<int>) toTabularForm(ToTabularFormRef ref) {
  final tableuSize = ref.watch(calculateSizeProvider);
  final DataEntryState dataEntry = ref.watch(dataEntryControllerProvider);
  final tableau = List.generate(tableuSize.x, (index) => List.generate(tableuSize.y, (index) => 0.0));
//fills the first row with the objective function
  for (var i = 0; i < dataEntry.objectiveFunction.length; i++) {
    tableau[0][i] =
        dataEntry.objective == Objectives.max ? -dataEntry.objectiveFunction[i] : dataEntry.objectiveFunction[i];
  }
  //fills the contraints after the first row
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    for (var j = 0; j < dataEntry.constraints[i].length - 1; j++) {
      tableau[i + 1][j] = dataEntry.constraints[i][j];
    }
  }
  //fills the last column with the right side of the constraints
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    tableau[i + 1].last = dataEntry.constraints[i].last;
  }
  //find out if the problem needs two phase method
  final needsTwoPhase = dataEntry.operators.any((element) => element != Operators.leq);
  //fills the slack variables, track artificial variables
  List<int> artificialVariablesIndexes = [];
  int j = dataEntry.constraints.first.length - 1;
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    tableau[i + 1][j + i] = dataEntry.operators[i] == Operators.geq ? -1 : 1;
    if (needsTwoPhase && dataEntry.operators[i] == Operators.geq) {
      tableau[i + 1][++j + i] = 1;
    }
    if (dataEntry.operators[i] != Operators.leq) artificialVariablesIndexes.add(j + i);
  }
  if (needsTwoPhase) {
    //find resulting objective function given the artificial variables
    final count = dataEntry.operators.where((element) => element != Operators.leq).length;
    final matrix = List.generate(count + 1, (index) => List.generate(tableuSize.y, (index) => 0.0));
    matrix[0] = [];
    for (var i = 0; i < tableuSize.y; i++) {
      if (artificialVariablesIndexes.contains(i)) {
        matrix[0].add(1);
      } else {
        matrix[0].add(0);
      }
    }
    j = 1;
    for (var i = 0; i < dataEntry.operators.length; i++) {
      if (dataEntry.operators[i] != Operators.leq) {
        for (var k = 0; k < tableuSize.y; k++) {
          matrix[j][k] = -tableau[i + 1][k];
        }
        j++;
      }
    }
    //result, create a list with the sum columns of matrix
    final result = List.generate(tableuSize.y, (index) => 0.0);
    for (var j = 0; j < matrix.length; j++) {
      for (var i = 0; i < tableuSize.y; i++) {
        result[i] += matrix[j][i];
      }
    }
    tableau[0] = result;
  }
  final basicVariables = List.generate(dataEntry.constraints.length, (index) => 'x_${index + 1}');
  // debugPrint('tableuSize: $tableuSize');
  // debugPrint('tableu: $tableu');
  return (
    TabularFormInformation(
      matrix: tableau,
      basicVariables: basicVariables,
    ),
    artificialVariablesIndexes,
  );
}

@riverpod
class SimplexController extends _$SimplexController {
  List<TabularFormInformation> _followingTableaus = [];
  List<int> _artificialVariablesIndexes = [];
  final List<Point<int>> _pivotsCoordinates = [];
  // List<List<List<double>>> get tableus => _followingTableus;
  List<Point<int>> get pivotsCoordinates => _pivotsCoordinates;
  @override
  void build() {
    final (tabularFormInfo, artificialVariablesIndexes) = ref.watch(toTabularFormProvider);
    _followingTableaus = [tabularFormInfo];
    _artificialVariablesIndexes = artificialVariablesIndexes;
  }

  SimplexDataModel getAnswer() {
    SimplexStatus status = SimplexStatus.notOptimal;
    // int i = 0;
    // while (!(status == SimplexStatus.optimal || status == SimplexStatus.unbounded)) {
    //   status = _compute();
    //   debugPrint('i: ${++i}\t status: $status');
    // }
    // debugPrint('out of while loop');
    List<List<List<String>>> tableausString = tableausToString();
    return SimplexDataModel(
      tableaus: tableausString,
      pivotsCoordinates: pivotsCoordinates,
      status: status,
    );
  }

  List<List<List<String>>> tableausToString() {
    List<List<List<String>>> tableausString = [];
    for (var i = 0; i < _followingTableaus.length; i++) {
      List<List<String>> tableuString = [];
      for (var j = 0; j < _followingTableaus[i].matrix.length; j++) {
        List<String> rowString = [];
        if (j == 0) {
          rowString.add('Z');
        } else {
          if (_followingTableaus[i].basicVariables.length > j - 1) {
            rowString.add(_followingTableaus[i].basicVariables[j - 1]);
          }
        }
        for (var k = 0; k < _followingTableaus[i].matrix[j].length; k++) {
          rowString.add(_followingTableaus[i].matrix[j][k].toStringAsFixed(3).deleteLastZero());
        }
        tableuString.add(rowString);
      }
      tableausString.add(tableuString);
    }
    return tableausString;
  }

  SimplexStatus _compute() {
    //step 1 - check optimality
    if (isOptimal()) {
      debugPrint('isOptimal');
      return SimplexStatus.optimal;
    }
    //step 2 - find pivot coordinates
    final Point<int> pivotCoordinates = findPivotCoordinates(_followingTableaus.last.matrix);
    debugPrint('pivotCoordinates: $pivotCoordinates');
    if (pivotCoordinates == const Point<int>(-1, -1)) return SimplexStatus.unbounded;
    //step 3 - form next tableu
    formNextTableu(pivotCoordinates);
    return SimplexStatus.notOptimal;
  }

  bool isOptimal() {
    return _followingTableaus.last.matrix.first.every((element) => element >= 0);
  }

  Point<int> findPivotCoordinates(List<List<double>> tableu) {
    final smallestColumnPosition = tableu[0].indexOf(tableu[0].reduce(min));
    if (smallestColumnPosition < 0) return const Point<int>(-1, -1);
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
    final List<List<double>> previousTableu = _followingTableaus.last.matrix;
    final List<List<double>> nextTableu = List.generate(
      previousTableu.length,
      (index) => List.generate(previousTableu[index].length, (index) => 0.0),
    );
    final double pivotValue = previousTableu[pivotCoordinates.y][pivotCoordinates.x];
    //fills the pivot row
    for (var i = 0; i < previousTableu[pivotCoordinates.y].length; i++) {
      nextTableu[pivotCoordinates.y][i] = previousTableu[pivotCoordinates.y][i] / pivotValue;
    }
    for (var i = 0; i < previousTableu.length; i++) {
      if (i != pivotCoordinates.y) {
        //get coeficient of the pivot column
        final pivotColumnValue = previousTableu[i][pivotCoordinates.x];
        //calculate the values for the new row
        for (var j = 0; j < previousTableu[i].length; j++) {
          final double previousColumnValue = previousTableu[i][j];
          final double nextColumnValue = nextTableu[pivotCoordinates.y][j];
          final double product = (pivotColumnValue).abs() * nextColumnValue;
          late final double valueforNextTableu;
          if (pivotColumnValue < 0) {
            valueforNextTableu = previousColumnValue + product;
          } else {
            valueforNextTableu = previousColumnValue - product;
          }
          nextTableu[i][j] = valueforNextTableu;
        }
      }
    }
    _followingTableaus
        .add(TabularFormInformation(matrix: nextTableu, basicVariables: _followingTableaus.last.basicVariables));
    debugPrint('nextTableu: $nextTableu');
    return nextTableu;
  }
}
