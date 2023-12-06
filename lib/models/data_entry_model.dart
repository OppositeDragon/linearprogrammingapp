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
class DataEntryState with _$DataEntryState {
  const factory DataEntryState({
    required Objectives objective,
    required List<double> objectiveFunction,
    required List<Operators> operators,
    required List<List<double>> constraints,
  }) = _DataEntryModel;

  factory DataEntryState.fromJson(Map<String, dynamic> json) => _$DataEntryStateFromJson(json);
}

