import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/enums.dart';
import '../models/data_entry_model.dart';

part 'data_entry_controller.g.dart';

@riverpod
class EntryPageController extends _$EntryPageController {
  @override
  int build() => 0;

  void updatePage(int page) {
    state = page;
    debugPrint('PageController: $state');
  }
}

@riverpod
class EntrySizeController extends _$EntrySizeController {
  @override
  EntrySizeState build() => const EntrySizeState(variables: 0, constraints: 0);

  void setVariables(String source) {
    if (int.tryParse(source) == null) return;
    final value = int.parse(source);
    if (state.variables == value) return;
    state = state.copyWith(
      variables: value,
      showProcess: value == 2,
    );
    if (state.variables != 2) {
      ref.read(processTypeControllerProvider.notifier).setProcess(ProcessTypes.simplex);
    }
  }

  void setConstraints(String source) {
    if (int.tryParse(source) == null) return;
    final value = int.parse(source);
    if (state.constraints == value) return;
    state = state.copyWith(constraints: value);
  }

  void setData(int variablesLength, int constraintsLength) {
    state = state.copyWith(
      variables: variablesLength,
      constraints: constraintsLength,
      showProcess: variablesLength == 2,
    );
    if (state.variables != 2) {
      ref.read(processTypeControllerProvider.notifier).setProcess(ProcessTypes.simplex);
    }
  }
}

@riverpod
class ProcessTypeController extends _$ProcessTypeController {
  @override
  ProcessTypes build() => ProcessTypes.simplex;

  void setProcess(ProcessTypes process) {
    state = process;
  }
}

@riverpod
class DataEntryController extends _$DataEntryController {
  @override
  DataEntryModel build() {
    final variables = ref.watch(entrySizeControllerProvider.select((value) => value.variables));
    final constraints = ref.watch(entrySizeControllerProvider.select((value) => value.constraints));
    final DataEntryModel dataEntryState = DataEntryModel(
      objectiveFunction: List.generate(variables, (i) => 0.0),
      constraints: List.generate(constraints, (i) => List.generate(variables + 1, (j) => 0.0)),
      operators: List.generate(constraints, (i) => Operators.leq),
      objective: Objectives.max,
    );
    debugPrint('$dataEntryState');
    return dataEntryState;
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

  void setData(DataEntryModel data) {
    state = data;
  }
}
