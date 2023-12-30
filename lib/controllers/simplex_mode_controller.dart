import 'dart:math';

import 'package:decimal/decimal.dart';
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
bool needsTwoPhase(NeedsTwoPhaseRef ref) {
  final DataEntryModel dataEntry = ref.watch(dataEntryControllerProvider);
  return dataEntry.operators.any((element) => element != Operators.leq);
}

@riverpod
Point<int> calculateSize(CalculateSizeRef ref) {
  final EntrySizeState entrySize = ref.watch(entrySizeControllerProvider);
  final DataEntryModel dataEntry = ref.watch(dataEntryControllerProvider);
  final needsTwoPhase = ref.watch(needsTwoPhaseProvider);
  final int rows = entrySize.constraints + 1;
  final int columns = entrySize.variables + entrySize.constraints + 1;
  if (needsTwoPhase) {
    int extraColumns = 0;
    for (int i = 0; i < dataEntry.operators.length; i++) {
      if (dataEntry.operators[i] == Operators.geq) extraColumns++;
    }
    return Point<int>(rows, columns + extraColumns);
  }
  return Point<int>(rows, columns);
}

@riverpod
(TabularFormInformation, List<int>) toTabularForm(ToTabularFormRef ref) {
  final tableauSize = ref.watch(calculateSizeProvider);
  final DataEntryModel dataEntry = ref.watch(dataEntryControllerProvider);
  final tableau = List<List<double>>.generate(
    tableauSize.x,
    (index) => List.generate(tableauSize.y, (index) => 0),
  );
  final basicVariables = <int>[];

  //fills the first row with the objective function
  for (int i = 0; i < dataEntry.objectiveFunction.length; i++) {
    tableau[0][i] =
        dataEntry.objective == Objectives.max ? -dataEntry.objectiveFunction[i] : dataEntry.objectiveFunction[i];
  }
  //fills the contraints after the first row
  for (int i = 0; i < dataEntry.constraints.length; i++) {
    for (int j = 0; j < dataEntry.constraints[i].length - 1; j++) {
      tableau[i + 1][j] = dataEntry.constraints[i][j];
    }
  }
  //fills the last column with the right side of the constraints
  for (int i = 0; i < dataEntry.constraints.length; i++) {
    tableau[i + 1].last = dataEntry.constraints[i].last;
  }
  //find out if the problem needs two phase method
  final needsTwoPhase = ref.watch(needsTwoPhaseProvider);
  //fills the slack variables, track artificial variables
  List<int> artificialVariablesIndexes = [];
  int aux = dataEntry.constraints.first.length - 1;
  for (int i = 0; i < dataEntry.constraints.length; i++) {
    if (dataEntry.operators[i] == Operators.geq) {
      tableau[i + 1][aux + i] = -1;
      if (needsTwoPhase) {
        tableau[i + 1][++aux + i] = 1;
      }
    } else {
      tableau[i + 1][aux + i] = 1;
    }
    basicVariables.add(aux + i + 1);
    if (dataEntry.operators[i] != Operators.leq) {
      artificialVariablesIndexes.add(aux + i);
    }
  }
  if (needsTwoPhase) {
    //find resulting objective function given the artificial variables
    final count = dataEntry.operators.where((element) => element != Operators.leq).length;
    final matrix = List<List<double>>.generate(
      count + 1,
      (index) => List.generate(tableauSize.y, (index) => 0),
    );
    //reset first row
    matrix[0] = [];
    for (int i = 0; i < tableauSize.y; i++) {
      if (artificialVariablesIndexes.contains(i)) {
        matrix[0].add(1);
      } else {
        matrix[0].add(0);
      }
    }
    aux = 1;
    for (int i = 0; i < dataEntry.operators.length; i++) {
      if (dataEntry.operators[i] != Operators.leq) {
        for (int k = 0; k < tableauSize.y; k++) {
          matrix[aux][k] = -tableau[i + 1][k];
        }
        aux++;
      }
    }
    //result, create a list with the sum columns of matrix
    final result = List<double>.generate(tableauSize.y, (index) => 0);
    for (int i = 0; i < matrix.length; i++) {
      for (int k = 0; k < tableauSize.y; k++) {
        result[k] += matrix[i][k];
      }
    }
    tableau[0] = result;
  }
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
  List<TabularFormInformation> _firstPhaseTableaus = [];
  List<int> _artificialVariablesIndexes = [];
  List<Point<int>> _pivotsCoordinates = [];
  List<Point<int>> _firstPhasePivotsCoordinates = [];
  @override
  SimplexDataModel build() {
    final (tabularFormInfo, artificialVariablesIndexes) = ref.watch(toTabularFormProvider);
    _followingTableaus = [tabularFormInfo];
    _artificialVariablesIndexes = artificialVariablesIndexes;
    return computeAnswer();
  }

  SimplexDataModel computeAnswer() {
    final size = ref.watch(calculateSizeProvider);
    final needsTwoPhase = ref.watch(needsTwoPhaseProvider);
    final dataEntry = ref.watch(dataEntryControllerProvider);
    SimplexStatus status = SimplexStatus.notOptimal;
    if (needsTwoPhase) {
      int i = 0;
      while (!(status == SimplexStatus.optimal || status == SimplexStatus.unbounded)) {
        status = _compute1stPhase();
        debugPrint('1st phase -> i: $i\t status: $status');
        if (++i > size.y) break;
      }
      debugPrint('1st phase out of while loop');
    }
    if (needsTwoPhase) {
      //place 1st phase tableaus on its own variable
      _firstPhaseTableaus = [..._followingTableaus];
      _firstPhasePivotsCoordinates = [..._pivotsCoordinates];
      if (_followingTableaus.last.matrix.first.last == 0) {
        //drop artificial columns
        final List<List<double>> previousTableu = _followingTableaus.last.matrix;
        final List<int> basicVariables = _followingTableaus.last.basicVariables;
        final List<List<double>> nextTableu = [];
        for (int i = 1; i < previousTableu.length; i++) {
          List<double> row = [];
          for (int j = 0; j < previousTableu[i].length; j++) {
            if (!_artificialVariablesIndexes.contains(j)) {
              row.add(previousTableu[i][j]);
            }
          }
          nextTableu.add(row);
        }
        //create a new row, to start calculating the new Z row
        final ofTabular = previousTableu.first;
        for (int i = 0; i < dataEntry.objectiveFunction.length; i++) {
          ofTabular[i] = dataEntry.objectiveFunction[i];
        }
        List<double> newObjectiveFunction = List<double>.generate(ofTabular.length, (index) => 0);
        //values of the objective function in the position of basic variables
        final basicVariablesValues = List<double>.generate(dataEntry.constraints.length, (index) => 0);
        for (int i = 0; i < basicVariables.length; i++) {
          if (basicVariables[i] - 1 < dataEntry.objectiveFunction.length) {
            basicVariablesValues[i] = dataEntry.objectiveFunction[basicVariables[i] - 1];
          }
        }
        //calculate values for the Z row
        for (int i = 0; i < ofTabular.length; i++) {
          double sum = 0;
          for (int j = 0; j < previousTableu.length - 1; j++) {
            sum += basicVariablesValues[j] * previousTableu[j + 1][i];
          }
          newObjectiveFunction[i] = ofTabular[i] - sum;
        }
        //remove artificial variables from new objective function
        _artificialVariablesIndexes.sort((a, b) => b.compareTo(a));
        for (var index in _artificialVariablesIndexes) {
          newObjectiveFunction.removeAt(index);
        }
        if (dataEntry.objective == Objectives.max) {
          newObjectiveFunction = newObjectiveFunction * -1;
        }
        nextTableu.insert(0, newObjectiveFunction);

        //set up for second phase
        _followingTableaus = [
          TabularFormInformation(
            matrix: nextTableu,
            basicVariables: basicVariables,
          ),
        ];
      } else {
        _followingTableaus = [];
        _pivotsCoordinates = [];
      }
    }

    int i = 0;
    if (status == SimplexStatus.optimal) {
      status = SimplexStatus.notOptimal;
    }
    //compute 2nd phase
    i = 0;
    while (!(status == SimplexStatus.optimal || status == SimplexStatus.unbounded)) {
      status = _compute2ndPhase();
      debugPrint('i: $i\t status: $status');
      if (++i > size.y) break;
    }
    debugPrint('out of while loop');
    List<List<List<String>>> tableausString = tableausToString(_followingTableaus);
    List<List<List<String>>> tableaus1stString = tableausToString(_firstPhaseTableaus);
    AnswerPresentationModel? answerPresentation;
    if (tableausString.isNotEmpty) {
      double z = _followingTableaus.last.matrix.first.last;
      if (dataEntry.objective == Objectives.min) z = -z;
      final List<AnswerVariableData> variablesData = [];
      for (int i = 0; i < dataEntry.objectiveFunction.length; i++) {
        final indexInBV = _followingTableaus.last.basicVariables.indexOf(i + 1);
        variablesData.add(
          (
            letter: '${i + 1}',
            coefficient: dataEntry.objectiveFunction[i],
            value: _followingTableaus.last.matrix[indexInBV + 1].last,
          ),
        );
      }
      answerPresentation = AnswerPresentationModel(variablesData: variablesData, z: z);
    }
    return SimplexDataModel(
      artificialVariablesIndexes: needsTwoPhase ? _artificialVariablesIndexes : null,
      pivotsCoordinates1st: needsTwoPhase ? _firstPhasePivotsCoordinates : null,
      tableaus1st: needsTwoPhase ? tableaus1stString : null,
      tableaus: tableausString,
      pivotsCoordinates: _pivotsCoordinates,
      status: status,
      answerPresentation: answerPresentation,
    );
  }

  List<List<List<String>>> tableausToString(List<TabularFormInformation> tableaus) {
    List<List<List<String>>> tableausString = [];
    for (int i = 0; i < tableaus.length; i++) {
      List<List<String>> tableauString = [];
      for (int j = 0; j < tableaus[i].matrix.length; j++) {
        List<String> rowString = [];
        if (j == 0) {
          rowString.add('Z');
        } else {
          if (tableaus[i].basicVariables.length > j - 1) {
            rowString.add('x_${tableaus[i].basicVariables[j - 1]}');
          }
        }
        for (int k = 0; k < tableaus[i].matrix[j].length; k++) {
          rowString.add(tableaus[i].matrix[j][k].toStringAsFixed(3).deleteLastZero());
        }
        tableauString.add(rowString);
      }
      tableausString.add(tableauString);
    }
    return tableausString;
  }

  SimplexStatus _compute1stPhase() {
    //step 1 - check optimality
    if (isOptimal1stPhase()) {
      debugPrint('isOptimal');
      return SimplexStatus.optimal;
    }
    if (!_shouldContinue()) {
      return SimplexStatus.unbounded;
    }

    //step 2 - find pivot coordinates
    final Point<int> pivotCoordinates = findPivotCoordinates(_followingTableaus.last.matrix);
    debugPrint('pivotCoordinates: $pivotCoordinates');
    if (pivotCoordinates == const Point<int>(-1, -1)) return SimplexStatus.unbounded;
    //step 3 - form next tableu
    formNextTableu(pivotCoordinates);
    return SimplexStatus.notOptimal;
  }

  SimplexStatus _compute2ndPhase() {
    //step 1 - check optimality
    if (isOptimal2ndPhase()) {
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

  bool isOptimal1stPhase() {
    for (var index in _artificialVariablesIndexes) {
      if (_followingTableaus.last.matrix.first[index] != 1) {
        return false;
      }
    }
    return true;
  }

  bool _shouldContinue() {
    return _followingTableaus.last.matrix.first
        .sublist(0, _followingTableaus.last.matrix.first.length - 1)
        .any((element) => element < 0);
  }

  bool isOptimal2ndPhase() {
    for (var i = 0; i < _followingTableaus.last.matrix.first.length - 1; i++) {
      if (_followingTableaus.last.matrix.first[i] < 0) return false;
    }
    return true;
  }

  Point<int> findPivotCoordinates(List<List<double>> tableu) {
    final taleauSublist = tableu.first.sublist(0, tableu.first.length - 1);
    int smallestColumnPosition = 0;
    double smallestValue = taleauSublist[0];
    for (int i = 1; i < taleauSublist.length; i++) {
      if (smallestValue >= taleauSublist[i]) {
        smallestValue = taleauSublist[i];
        smallestColumnPosition = i;
      }
    }
    if (smallestColumnPosition < 0) return const Point<int>(-1, -1);
    int smallestRowPosition = -1;
    double smallestresult = -1;
    for (int i = 0; i < tableu.length; i++) {
      final double value = tableu[i][smallestColumnPosition];
      if (value > 0) {
        final result =
            (tableu[i].last.toDecimal() / value.toDecimal()).toDecimal(scaleOnInfinitePrecision: 6).toDouble();
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
      (index) => List.generate(previousTableu[index].length, (index) => 0),
    );
    final double pivotValue = previousTableu[pivotCoordinates.y][pivotCoordinates.x];
    //fills the pivot row
    for (int i = 0; i < previousTableu[pivotCoordinates.y].length; i++) {
      nextTableu[pivotCoordinates.y][i] = (previousTableu[pivotCoordinates.y][i].toDecimal() / pivotValue.toDecimal())
          .toDecimal(scaleOnInfinitePrecision: 10)
          .toDouble();
    }
    for (int i = 0; i < previousTableu.length; i++) {
      if (i != pivotCoordinates.y) {
        //get coeficient of the pivot column
        final pivotColumnValue = previousTableu[i][pivotCoordinates.x];
        //calculate the values for the new row
        for (int j = 0; j < previousTableu[i].length; j++) {
          final double previousColumnValue = previousTableu[i][j];
          final double nextColumnValue = nextTableu[pivotCoordinates.y][j];
          final Decimal product = ((pivotColumnValue).abs().toDecimal() * nextColumnValue.toDecimal());
          late final Decimal valueforNextTableu;
          if (pivotColumnValue < 0) {
            valueforNextTableu = (previousColumnValue.toDecimal() + product);
          } else {
            valueforNextTableu = (previousColumnValue.toDecimal() - product);
          }
          nextTableu[i][j] = double.parse(valueforNextTableu.toStringAsFixed(5));
        }
      }
    }
    //update basic variables
    final nextBasicVariables = [..._followingTableaus.last.basicVariables];
    nextBasicVariables[pivotCoordinates.y - 1] = pivotCoordinates.x + 1;
    _followingTableaus.add(TabularFormInformation(matrix: nextTableu, basicVariables: nextBasicVariables));
    debugPrint('nextTableu: ${nextTableu.toStringMatrix()}');
    return nextTableu;
  }
}
