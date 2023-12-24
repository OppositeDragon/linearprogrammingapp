import 'package:linearprogrammingapp/constants/enums.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:linearprogrammingapp/models/data_entry_model.dart';

class MockSizeEntry2Var3Con extends EntrySizeController {
  @override
  EntrySizeState build() => const EntrySizeState(variables: 2, constraints: 3, showProcess: true);
}

class MockSizeEntry2Var7Con extends EntrySizeController {
  @override
  EntrySizeState build() => const EntrySizeState(variables: 2, constraints: 7, showProcess: false);
}

class MockSizeEntry3Var3Con extends EntrySizeController {
  @override
  EntrySizeState build() => const EntrySizeState(variables: 3, constraints: 3, showProcess: false);
}

class MockDataMaximize2Var3Con extends DataEntryController {
  @override
  DataEntryState build() {
    return const DataEntryState(
      objective: Objectives.max,
      objectiveFunction: [180, 90],
      operators: [
        Operators.leq,
        Operators.leq,
        Operators.leq,
      ],
      constraints: [
        [6, 8, 48],
        [1, 0, 6],
        [0, 1, 4],
      ],
    );
  }
}

class MockDataMinimize2Var3Con extends DataEntryController {
  @override
  DataEntryState build() {
    return const DataEntryState(
      objective: Objectives.min,
      objectiveFunction: [0.4, 0.5],
      operators: [
        Operators.leq,
        Operators.equal,
        Operators.geq,
      ],
      constraints: [
        [0.3, 0.1, 2.7],
        [0.5, 0.5, 6],
        [0.6, 0.4, 6],
      ],
    );
  }
}

class MockDataMaximize2Var7Con extends DataEntryController {
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

class MockDataMinimize3Var3Con extends DataEntryController {
  @override
  DataEntryState build() {
    return const DataEntryState(
      objective: Objectives.min,
      objectiveFunction: [0.4, 0.35, 0.3],
      operators: [
        Operators.equal,
        Operators.leq,
        Operators.geq,
      ],
      constraints: [
        [6.4, 5.2, 3.36, 280],
        [1.76, 3.2, 2.8, 180],
        [0.8, 0.8, 0.8, 40],
      ],
    );
  }
}

class MockDataMaximize3Var3Con extends DataEntryController {
  @override
  DataEntryState build() {
    return const DataEntryState(
      objective: Objectives.min,
      objectiveFunction: [0.4, 0.35, 0.3],
      operators: [
        Operators.equal,
        Operators.leq,
        Operators.geq,
      ],
      constraints: [
        [6.4, 5.2, 3.36, 280],
        [1.76, 3.2, 2.8, 180],
        [0.8, 0.8, 0.8, 40],
      ],
    );
  }
}
