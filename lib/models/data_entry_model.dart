import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/enums.dart';

part 'data_entry_model.freezed.dart';
part 'data_entry_model.g.dart';

@freezed
class DataEntryModel with _$DataEntryModel {
  const factory DataEntryModel({
    required List<double> objectiveFunction,
    required List<List<double>> constraints,
    required List<Operators> operators,
    required Objectives objective,
  }) = _DataEntryModel;

  factory DataEntryModel.fromJson(Map<String, dynamic> json) => _$DataEntryModelFromJson(json);
}
