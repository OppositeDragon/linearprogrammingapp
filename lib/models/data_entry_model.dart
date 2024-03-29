import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/enums.dart';

part 'data_entry_model.freezed.dart';
part 'data_entry_model.g.dart';

@freezed
class EntrySizeState with _$EntrySizeState {
  const factory EntrySizeState({
    required int variables,
    required int constraints,
    @Default(false) bool showProcess,
  }) = _EntrySizeState;
}

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

typedef AnswerVariableData = ({String letter, double coefficient, double value});

@freezed
class AnswerPresentationModel with _$AnswerPresentationModel {
  const AnswerPresentationModel._();
  const factory AnswerPresentationModel({
    required List<AnswerVariableData> variablesData,
    required double z,
  }) = _AnswerPresentationModel;
}
