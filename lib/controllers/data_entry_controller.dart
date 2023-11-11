import 'dart:math';

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
class DataControllerForGraphic extends _$DataControllerForGraphic {
  @override
  void build() {}

  DataModelForGraphic interceptions() {
    final data = ref.read(dataEntryControllerProvider);
    List<Point<double>> interceptions = [];
    for (final eq in data.constraints) {
      final [first, second, ..., last] = eq;
      final double intX = first == 0 ? 0 : last / first;
      final double intY = second == 0 ? 0 : last / second;
      interceptions.add(Point<double>(intX, intY));
    }
    double maxX = 0;
    double maxY = 0;
    for (var inter in interceptions) {
      if (inter.x > maxX) maxX = inter.x;
      if (inter.y > maxY) maxY = inter.y;
    }
    final max = Point(maxX, maxY);
    return DataModelForGraphic(intersections: interceptions, max: max);
  }
}
