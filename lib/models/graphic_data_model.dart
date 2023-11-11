import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'graphic_data_model.freezed.dart';

typedef PointPair = ({Point<double> p1, Point<double> p2});
typedef NullablePoints = ({Point<double>? p1, Point<double>? p2});

@freezed
class GraphicDataModel with _$GraphicDataModel {
  const factory GraphicDataModel({
    required double xLimit,
    required double yLimit,
    required Point<double> answer,
    required PointPair objectiveFunctionIntersections,
    required List<PointPair> restrictions,
    required List<Point<double>> compliantIntersections,
    required List<List<Point<double>>> feasibleRegionMatrixPoints,
    @Default('feasible\nregion') String feasibleRegionText,
  }) = _GraphicDataModel;
}
