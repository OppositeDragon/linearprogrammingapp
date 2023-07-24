import 'package:equations/equations.dart';
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
    List<List<double>> constraintWithSlackAndRightSide = List.generate(
      data.constraints.length,
      (index) => [],
    );
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
      final List<double> completeConstraintsAux = [];
      final List<String> completeConstraintsAuxString = [];
      for (int j = 0; j < constraintWithSlackAndRightSide[i].length; j++) {
        if (j == constraintWithSlackAndRightSide[i].length - 1) {
          rightSide.add(constraintWithSlackAndRightSide[i][j]);
          rightSideString.add(toStringWithSign(constraintWithSlackAndRightSide[i][j], 0, false, true));
        } else {
          completeConstraintsAuxString.add(
            toStringWithSign(constraintWithSlackAndRightSide[i][j], j + 1),
          );
          completeConstraintsAux.add(constraintWithSlackAndRightSide[i][j]);
        }
      }
      completeConstraintsAuxString.add(toStringWithSign(0, 0, true));
      constraintsWithSlackString.add(completeConstraintsAuxString);
      constraintWithSlack.add(completeConstraintsAux);
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

  AnswerForAlgebraic answerAlgebraic(List<List<double>> constraints, List<double> righSide) {
    final data = ref.read(dataEntryControllerProvider);
    final objectiveFunction = data.objectiveFunction;
    final objective = data.objective;
    List<StepsForAlgebraic> stepsAlgebraic = [];
    List<List<double>> values = [];
    double definitiveSolution = objective == Objectives.max ? -1 : double.maxFinite;
    int i = 0;
    int solutionInStep = 0;
    String? finalSolutionString;
    for (int j = 0; j < constraints[0].length; j++) {
      for (int k = j + 1; k < constraints[0].length; k++) {
        List<List<double>> matrix = [];
        i++;
        for (int l = 0; l < constraints.length; l++) {
          List<double> valuesAux = [];
          for (int m = 0; m < constraints[l].length; m++) {
            if (m != j && m != k) {
              valuesAux.add(constraints[l][m]);
            }
          }
          matrix.add(valuesAux);
        }
        final whereVarEqualsZero = [j + 1, k + 1];
        final solutions = LUSolver(
                matrix: RealMatrix.fromData(
                  rows: constraints.length,
                  columns: constraints.length,
                  data: matrix,
                ),
                knownValues: righSide)
            .solve();
        List<String> solutionsString = [];
        final listOfNumbers = List.generate(constraints[0].length, (index) => index + 1);
        listOfNumbers.removeWhere(
          (item) => whereVarEqualsZero.any((element) => element == item),
        );
        for (var n = 0; n < listOfNumbers.length; n++) {
          solutionsString.add(
            'x_{${listOfNumbers[n]}}=${deleteLastZero(solutions[n].toStringAsFixed(3))}',
          );
        }
        final isValid = !solutions.any((element) => element < 0 || element.isNaN);
        String? solutionString;
        double? objectiveFunctionSolution;

        if (isValid) {
          final isOneZero = whereVarEqualsZero.any((element) => element == 1);
          final isTwoZero = whereVarEqualsZero.any((element) => element == 2);
          final oneValue = isOneZero ? 0 : solutions[listOfNumbers.indexOf(1)];
          final twoValue = isTwoZero ? 0 : solutions[listOfNumbers.indexOf(2)];

          objectiveFunctionSolution = objectiveFunction[0] * oneValue + objectiveFunction[1] * twoValue;
          solutionString =
              'Z=${deleteLastZero(objectiveFunction[0].toStringAsFixed(3))} (${deleteLastZero(oneValue.toStringAsFixed(3))}) ${getSign(objectiveFunction[1])} ${deleteLastZero(objectiveFunction[1].toStringAsFixed(3))} (${deleteLastZero(twoValue.toStringAsFixed(3))}) = ${deleteLastZero(objectiveFunctionSolution.toStringAsFixed(3))}';
          if (objective == Objectives.max) {
            if (definitiveSolution < objectiveFunctionSolution) {
              definitiveSolution = objectiveFunctionSolution;
              finalSolutionString = solutionString;
              solutionInStep = i;
            }
          } else {
            if (definitiveSolution > objectiveFunctionSolution) {
              definitiveSolution = objectiveFunctionSolution;
              finalSolutionString = solutionString;
              solutionInStep = i;
            }
          }
        }
        final String header = 'x_{${whereVarEqualsZero[0]}} \\; y \\;x_{${whereVarEqualsZero[1]}}=0.';
        stepsAlgebraic.add(
          StepsForAlgebraic(
            header: header,
            step: i,
            whereVarEqualsZero: whereVarEqualsZero,
            solutions: solutions,
            matrix: matrix,
            solutionString: solutionString,
            solutionsString: solutionsString,
            objectiveFunctionSolution: objectiveFunctionSolution,
          ),
        );
      }
    }
    final wrapper = AnswerForAlgebraic(
      step: solutionInStep,
      steps: stepsAlgebraic,
      definitiveSolution: definitiveSolution,
      finalSolutionString: finalSolutionString,
    );
    debugPrint('\ni: $i; \nvalues: $values;\nwrapper: $wrapper;');
    return wrapper;
  }
}

String combinationsEquation(int variables, int constraints, int factorial) {
  return 'C(n,r) = \\frac{$variables!}{${variables - constraints}!($variables-${variables - constraints})!} = $factorial';
}

String deleteLastZero(String str) {
  if (str == 'NaN') {
    return 'indefinido';
  }
  while ((str.endsWith('0') || str.endsWith('.')) && str.length > 1) {
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1);
      break;
    }
    str = str.substring(0, str.length - 1);
  }
  return str;
}

List<List<T>> transpose<T>(List<List<T>> list) {
  List<List<T>> transposed = [];
  for (var i = 0; i < list[0].length; i++) {
    List<T> aux = [];
    for (var j = 0; j < list.length; j++) {
      aux.add(list[j][i]);
    }
    transposed.add(aux);
  }
  return transposed;
}

String toStringWithSign(double number, int i, [bool addEquals = false, bool isRightSide = false]) {
  final equal = addEquals ? '=' : '';
  String sign = getSign(number);
  if (number == 0 || isRightSide) {
    sign = '\\;';
  }
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

String getSign(num number) {
  return number < 0 ? '-' : '+';
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
