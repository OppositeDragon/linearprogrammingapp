import 'package:freezed_annotation/freezed_annotation.dart';
part 'algebraic_data_model.freezed.dart';

@freezed
class AlgebraicDataModel with _$AlgebraicDataModel {
  const factory AlgebraicDataModel({
    required List<List<double>> standardForm,
    required List<List<double>> constraintWithSlack,
    required List<List<String>> constraintsString,
    required List<double> rightSide,
    required List<String> rightSideString,
    required String greaterThanZeroCondition,
    required String combinationsEquation,
  }) = _AlgebraicDataModel;
}

@freezed
class AlgebraicSteps with _$AlgebraicSteps {
  const factory AlgebraicSteps({
    required String header,
    required int step,
    required List<int> whereVarEqualsZero,
    required List<double> solutions,
    required List<String> solutionsString,
    required List<List<double>> matrix,
    required String? solutionString,
    required double? objectiveFunctionSolution,
  }) = _StepsForAlgebraic;
}

@freezed
class AlgebraicAnswer with _$AlgebraicAnswer {
  const factory AlgebraicAnswer({
    required double definitiveSolution,
    required String? finalSolutionString,
    required int step,
    required List<AlgebraicSteps> steps,
  }) = _AlgebraicAnswer;
}
