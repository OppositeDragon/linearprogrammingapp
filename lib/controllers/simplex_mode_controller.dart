import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:linearprogrammingapp/constants/enums.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/data_entry_model.dart';

part 'simplex_mode_controller.g.dart';

typedef TableuSize = ({int rows, int columns});

@riverpod
Point<int> calculateSize(CalculateSizeRef ref) {
  final EntrySizeState entrySize = ref.watch(entrySizeControllerProvider);
  final int rows = entrySize.constraints + 1;
  final int columns = entrySize.variables + entrySize.constraints + 2;
  return Point(rows, columns);
}

@riverpod
List<List<double>> toTabularForm(ToTabularFormRef ref) {
  final tableuSize = ref.watch(calculateSizeProvider);
  final dataEntry = ref.watch(dataEntryControllerProvider);
  final tableu = List.generate(tableuSize.x, (index) => List.generate(tableuSize.y, (index) => 0.0));
  //fills the first row with the objective function
  for (var i = 0; i < dataEntry.objectiveFunction.length; i++) {
    tableu[0][i + 1] = -dataEntry.objectiveFunction[i];
  }
  tableu[0][0] = 1;
  //fills the contraints after the first column
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    for (var j = 0; j < dataEntry.constraints[i].length - 1; j++) {
      tableu[i + 1][j + 1] = dataEntry.constraints[i][j];
    }
  }
  //fills the last column with the right side of the constraints
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    tableu[i + 1].last = dataEntry.constraints[i].last;
  }
  //fills the slack variables
  for (var i = 0; i < dataEntry.constraints.length; i++) {
    tableu[i + 1][dataEntry.constraints.first.length + i] = dataEntry.operators[i] == Operators.leq ? -1 : 1;
  }
  // debugPrint('tableuSize: $tableuSize');
  // debugPrint('tableu: $tableu');
  return tableu;
}

@riverpod
Point<int> findPivotCoordinates(FindPivotCoordinatesRef ref, List<List<double>> tableu) {
  // final tableu = ref.watch(toTabularFormProvider);
  final smallestColumnPosition = tableu[0].indexOf(tableu[0].reduce(min));
  int smallestRowPosition = -1;
  double smallestresult = -1;
  for (var i = 0; i < tableu.length; i++) {
    final double value = tableu[i][smallestColumnPosition];
    if (value > 0) {
      final result = tableu[i].last / value;
      debugPrint('result: ${tableu[i].last}/$value = $result');
      if (result < smallestresult || smallestresult == -1) {
        smallestresult = result;
        smallestRowPosition = i;
      }
    }
  }
  debugPrint('smallestColumnPosition: $smallestColumnPosition; smallestRowPosition: $smallestRowPosition');

  return Point<int>(smallestColumnPosition, smallestRowPosition);
}
