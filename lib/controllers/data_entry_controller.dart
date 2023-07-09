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
