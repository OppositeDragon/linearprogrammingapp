import 'package:linearprogrammingapp/constants/enums.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:linearprogrammingapp/models/data_entry_model.dart';

class MockSizeEntryNonSimplex extends EntrySizeController {
  @override
  EntrySizeState build() => const EntrySizeState(variables: 2, constraints: 3, showProcess: true);
}

class MockSizeEntrySimplex extends EntrySizeController {
  @override
  EntrySizeState build() => const EntrySizeState(variables: 3, constraints: 3, showProcess: false);
}

class MockDataMaximize extends DataEntryController {
  @override
  DataEntryState build() {
    return const DataEntryState(
      objective: Objectives.max,
      objectiveFunction: [180, 90],
      operators: [
        Operators.geq,
        Operators.leq,
        Operators.leq,
        Operators.geq,
        Operators.leq,
        Operators.equal,
        Operators.geq,
      ],
      constraints: [
        [0, 1, 3],
        [0, 1, 8],
        [1, 0, 7],
        [1, 0, 3],
        [9, 9, 81],
        [6, 10, 60],
        [5, 7, 35],
      ],
    );
  }
}

class MockDataMinimize extends DataEntryController {
  @override
  DataEntryState build() {
    return const DataEntryState(
      objective: Objectives.min,
      objectiveFunction: [300, 500],
      operators: [
        Operators.geq,
        Operators.geq,
        Operators.geq,
      ],
      constraints: [
        [4, 5, 200],
        [2, 8, 160],
        [5, 3, 150],
      ],
    );
  }
}
