import 'package:flutter/material.dart';
import 'package:linearprogrammingapp/constants/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/data_entry_model.dart';

part 'data_entry_controller.g.dart';

typedef DataEntrySize = ({int variables, int constraints});

@Riverpod(keepAlive: true)
class DataEntrySizeController extends _$DataEntrySizeController {
  @override
  DataEntrySize build() => (variables: 0, constraints: 0);

  void updateValues(int variables, int constraints) {
    state = (variables: variables, constraints: constraints);
    debugPrint('DataEntrySizeController: $state');
  }
}

@Riverpod(keepAlive: true)
class ProcessController extends _$ProcessController {
  @override
  ProcessTypes build() {
    return ProcessTypes.simplex;
  }

  void updateProcess(ProcessTypes process) {
    state = process;
    debugPrint('ProcessController: $state');
  }
}

@Riverpod(keepAlive: true)
class DataEntryController extends _$DataEntryController {
  @override
  DataEntryModel build() {
    final dataSize = ref.watch(dataEntrySizeControllerProvider);
    return DataEntryModel(
      objectiveFunction: List.generate(dataSize.variables, (i) => 0.0),
      constraints: List.generate(dataSize.constraints, (i) => List.generate(dataSize.variables + 1, (j) => 0.0)),
      operators: List.generate(dataSize.constraints, (i) => Operators.leq),
      objective: Objectives.max,
    );
  }

  void updateObjective(Objectives objective) {
    state = state.copyWith(objective: objective);
  }

  void updateObjectiveFunction(int index, double value) {
    state = state.copyWith(objectiveFunction: List.from(state.objectiveFunction)..[index] = value);
  }

  void updateConstraints(int index, int index2, double value) {
    state = state.copyWith(constraints: List.from(state.constraints)..[index][index2] = value);
  }

  void updateOperator(int index, Operators op) {
    state = state.copyWith(operators: List.from(state.operators)..[index] = op);
  }

  void updateConstraintsRS(int index, double value) {
    state = state.copyWith(constraints: List.from(state.constraints)..[index].last = value);
  }
}

@Riverpod(keepAlive: true)
class DataControllerForAlgebraic extends _$DataControllerForAlgebraic {
  @override
  void build() {}

  DataModelForAlgebraic toStandardForm() {
    final dataSize = ref.watch(dataEntrySizeControllerProvider);
    final data = ref.watch(dataEntryControllerProvider);
    List<List<double>> constraintWithSlackAndRightSide = List.generate(data.constraints.length, (index) => []);
    for (int i = 0; i < data.constraints.length; i++) {
      for (int j = 0; j < data.constraints[i].length; j++) {
        if (j == data.constraints[i].length - 1) {
          for (int k = 0; k < data.constraints.length; k++) {
            if (k == i) {
              constraintWithSlackAndRightSide[i].add(data.operators[i].value);
            } else {
              constraintWithSlackAndRightSide[i].add(0);
            }
          }
        }
        constraintWithSlackAndRightSide[i].add(data.constraints[i][j]);
      }
    }
    List<List<String>> constraintsWithSlackString = [];
    List<List<double>> constraintWithSlack = [];
    List<String> rightSideString = [];
    List<double> rightSide = [];
    int variablesPlusSlack = dataSize.variables + dataSize.constraints;

    for (int i = 0; i < constraintWithSlackAndRightSide.length; i++) {
      final List<double> completeConstraintsTemp = [];
      final List<String> completeConstraintsTempString = [];
      for (int j = 0; j < constraintWithSlackAndRightSide[i].length; j++) {
        if (j == constraintWithSlackAndRightSide[i].length - 1) {
          rightSide.add(constraintWithSlackAndRightSide[i][j]);
          rightSideString.add(toStringWithSign(constraintWithSlackAndRightSide[i][j], 0, false, true));
        } else {
          completeConstraintsTempString.add(toStringWithSign(constraintWithSlackAndRightSide[i][j], j + 1));
          completeConstraintsTemp.add(constraintWithSlackAndRightSide[i][j]);
        }
      }
      completeConstraintsTempString.add(toStringWithSign(0, 0, true));
      constraintsWithSlackString.add(completeConstraintsTempString);
      constraintWithSlack.add(completeConstraintsTemp);
    }

    String greaterThanZeroCondition = '';
    for (var i = 1; i <= variablesPlusSlack; i++) {
      greaterThanZeroCondition += 'x_{$i}';
      if (i < variablesPlusSlack) {
        greaterThanZeroCondition += ',\\;';
      }
    }
    greaterThanZeroCondition += '\\geq 0';
    final dataA = DataModelForAlgebraic(
      standardForm: constraintWithSlackAndRightSide,
      constraintsString: transpose<String>(constraintsWithSlackString),
      constraintWithSlack: constraintWithSlack,
      rightSide: rightSide,
      rightSideString: rightSideString,
      greaterThanZeroCondition: greaterThanZeroCondition,
      combinationsEquation: combinationsEquation(
        variablesPlusSlack,
        dataSize.constraints,
        factorial(variablesPlusSlack) ~/
            (factorial(variablesPlusSlack - dataSize.constraints) *
                (factorial(variablesPlusSlack - (variablesPlusSlack - dataSize.constraints)))),
      ),
    );
    debugPrint(dataA.toString());
    return dataA;
  }
}

String combinationsEquation(int variables, int constraints, int factorial) {
  return 'C(n,r) = \\frac{$variables!}{${variables - constraints}!($variables-${variables - constraints})!} = $factorial';
}

String deleteLastZero(String str) {
  while ((str.endsWith('0') || str.endsWith('.')) && str.length > 1) {
    str = str.substring(0, str.length - 1);
  }
  return str;
}

List<List<T>> transpose<T>(List<List<T>> list) {
  List<List<T>> transposed = [];
  for (var i = 0; i < list[0].length; i++) {
    List<T> temp = [];
    for (var j = 0; j < list.length; j++) {
      temp.add(list[j][i]);
    }
    transposed.add(temp);
  }
  return transposed;
}

String toStringWithSign(double number, int i, [bool addEquals = false, bool isRightSide = false]) {
  final equal = addEquals ? '=' : '';
  final sign = number < 0
      ? '-'
      : number == 0 || isRightSide
          ? '\\;'
          : '+';
  if (isRightSide) {
    return '$sign${deleteLastZero('${number.abs()}')}';
  }
  switch (number) {
    case 0:
      return '\\;$equal';
    case 1 || -1:
      return '${sign}x_{$i}$equal';
    default:
      return '$sign${deleteLastZero(number.abs().toString())}x_{$i}$equal';
  }
}

int factorial(int number) {
  if (number == 0) {
    return 1;
  }
  int result = number;
  number--;
  while (number > 1) {
    result *= number;
    number--;
  }
  return result;
}
