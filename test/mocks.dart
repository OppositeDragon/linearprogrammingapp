import 'package:linearprogrammingapp/constants/enums.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:linearprogrammingapp/models/data_entry_model.dart';

class MockDataMax extends DataEntryController {
  @override
  DataEntryModel build() {
    return const DataEntryModel(
      objective: Objectives.max,
      objectiveFunction: [180, 90],
      operators: [Operators.geq, Operators.leq, Operators.equal],
      constraints: [
        [6, 8, 48],
        [1, 0, 6],
        [0, 1, 4],
      ],
    );
  }
}
