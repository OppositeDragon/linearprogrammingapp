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
    List<List<double>> constraintsPlusH = List.generate(data.constraints.length, (index) => []);
    List<List<String>> constraintsPlusHString = [];
    for (int i = 0; i < data.constraints.length; i++) {
      for (int j = 0; j < data.constraints[i].length; j++) {
        if (j == data.constraints[i].length - 1) {
          constraintsPlusH[i].add(data.operators[i].value);
        }
        constraintsPlusH[i].add(data.constraints[i][j]);
      }
    }
    final transposed = transpose<double>(constraintsPlusH);
    List<List<String>> constraintsString = [];
    List<String> rightHandString = [];
    List<String> slack = [];
    int j = dataSize.variables;
    for (int i = 0; i < data.constraints.length; i++) {
      final [first, second, ..., last] = data.constraints[i];
      final slackAsNumber = data.operators[i].value;
      constraintsString.add([
        toStringWithSign(first, 1),
        toStringWithSign(second, 2),
      ]);
      if (data.operators[i] != Operators.equal) j++;
      slack.add(toStringWithSign(slackAsNumber, j, true));
      rightHandString.add(toStringWithSign(last, 0, false, true));
    }
    String greaterThanZeroCondition = '';
    for (var i = 1; i <= j; i++) {
      greaterThanZeroCondition += 'x_{$i}';
      if (i < j) {
        greaterThanZeroCondition += ',\\;';
      }
    }
    greaterThanZeroCondition += '\\geq 0';

    final dataA = DataModelForAlgebraic(
        standardForm: transposed,
        constraintsString: transpose<String>(constraintsString),
        rightHandString: rightHandString,
        slack: slack,
        greaterThanZeroCondition: greaterThanZeroCondition,
        vrr: (
          variables: j,
          constraints: dataSize.constraints,
          f: factorial(j) ~/ (factorial(j - dataSize.constraints) * (factorial(j - (j - dataSize.constraints))))
        ));
    debugPrint(dataA.toString());
    return dataA;
  }
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

toStringWithSign(double number, int i, [bool addEquals = false, bool isRightHand = false]) {
  final equal = addEquals ? '=' : '';
  final sign = number < 0
      ? '-'
      : number == 0 || isRightHand
          ? '\\;'
          : '+';
  if (isRightHand) {
    return '$sign${deleteLastZero('${number.abs()}')}';
  }
  switch (number) {
    case 0:
      return '\\;$equal';
      break;
    case 1 || -1:
      return '${sign}x_{$i}$equal';
      break;
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
