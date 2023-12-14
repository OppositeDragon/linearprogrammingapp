import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linearprogrammingapp/constants/enums.dart';

part 'simplex_data_model.freezed.dart';

@freezed
class SimplexDataModel with _$SimplexDataModel {
  const SimplexDataModel._();
  const factory SimplexDataModel({
    required SimplexStatus status,
    required List<List<List<double>>> tableus,
    required List<Point<int>> pivotsCoordinates,
  }) = _SimplexDataModel;
}
