import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/enums.dart';

part 'data_entry_model.freezed.dart';
part 'data_entry_model.g.dart';

@freezed
class DataEntryModel with _$DataEntryModel {
  const factory DataEntryModel({
    required Objectives objective,
    required List<double> objectiveFunction,
    required List<Operators> operators,
    required List<List<double>> constraints,
  }) = _DataEntryModel;

  factory DataEntryModel.fromJson(Map<String, dynamic> json) => _$DataEntryModelFromJson(json);
}

@freezed
class DataModelForAlgebraic with _$DataModelForAlgebraic {
  const factory DataModelForAlgebraic({
    required List<List<double>> standardForm,
    required List<List<double>> constraintWithSlack,
    required List<List<String>> constraintsString,
    required List<double> rightSide,
    required List<String> rightSideString,
    required String greaterThanZeroCondition,
    required String combinationsEquation,
  }) = _DataModelForAlgebraic;
}
