import 'package:equations/equations.dart';
import 'package:flutter/foundation.dart';
import 'package:linearprogrammingapp/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/enums.dart';
import '../models/algebraic_data_model.dart';
import '../utils/methods.dart';
import 'data_entry_controller.dart';

part 'algebraic_mode_controller.g.dart';

@riverpod
class AlgebraicController extends _$AlgebraicController {
  @override
  void build() {}

  AlgebraicDataModel toStandardForm() {
    final dataSize = ref.watch(entrySizeControllerProvider);
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
    final dataA = AlgebraicDataModel(
      standardForm: constraintWithSlackAndRightSide,
      constraintsString: constraintsWithSlackString.transpose(),
      constraintWithSlack: constraintWithSlack,
      rightSide: rightSide,
      rightSideString: rightSideString,
      greaterThanZeroCondition: greaterThanZeroCondition,
      combinationsEquation: combinationsEquation(
        variablesPlusSlack,
        dataSize.constraints,
        variablesPlusSlack.factorial() ~/
            ((variablesPlusSlack - dataSize.constraints).factorial() *
                ((variablesPlusSlack - (variablesPlusSlack - dataSize.constraints)).factorial())),
      ),
    );
    debugPrint(dataA.toString());
    return dataA;
  }

  AlgebraicAnswer answerAlgebraic(List<List<double>> constraints, List<double> righSide) {
    final data = ref.read(dataEntryControllerProvider);
    final objectiveFunction = data.objectiveFunction;
    final objective = data.objective;
    List<AlgebraicSteps> stepsAlgebraic = [];
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
              'Z=${deleteLastZero(objectiveFunction[0].toStringAsFixed(3))} (${deleteLastZero(oneValue.toStringAsFixed(3))}) ${objectiveFunction[1].getSign()} ${deleteLastZero(objectiveFunction[1].toStringAsFixed(3))} (${deleteLastZero(twoValue.toStringAsFixed(3))}) = ${deleteLastZero(objectiveFunctionSolution.toStringAsFixed(3))}';
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
          AlgebraicSteps(
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
    final wrapper = AlgebraicAnswer(
      step: solutionInStep,
      steps: stepsAlgebraic,
      definitiveSolution: definitiveSolution,
      finalSolutionString: finalSolutionString,
    );
    debugPrint('\ni: $i; \nvalues: $values;\nwrapper: $wrapper;');
    return wrapper;
  }
}
