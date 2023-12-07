import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linearprogrammingapp/constants/enums.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';
import 'package:linearprogrammingapp/models/data_entry_model.dart';

import '../mocks.dart';

void main() {
  group('entryPageController', () {
    ProviderContainer createProviderContainer({
      ProviderContainer? parent,
      List<Override> overrides = const [],
      List<ProviderObserver>? observers,
    }) {
      final container = ProviderContainer(
        parent: parent,
        overrides: overrides,
        observers: observers,
      );
      addTearDown(container.dispose);
      return container;
    }

    test('check default page', () {
      final container = createProviderContainer();
      final page = container.read(entryPageControllerProvider);

      expect(page, 0);
    });

    test('update page', () {
      final container = createProviderContainer();
      container.read(entryPageControllerProvider.notifier).updatePage(1);
      final page = container.read(entryPageControllerProvider);

      expect(page, 1);
    });
  });
  group('entrySizeController', () {
    ProviderContainer createProviderContainer({
      ProviderContainer? parent,
      List<Override> overrides = const [],
      List<ProviderObserver>? observers,
    }) {
      final container = ProviderContainer(
        parent: parent,
        overrides: overrides,
        observers: observers,
      );
      addTearDown(container.dispose);
      return container;
    }

    test('check entrySizeState default values', () {
      final container = createProviderContainer();
      final entrySizeState = container.read(entrySizeControllerProvider);

      expect(
          entrySizeState,
          const EntrySizeState(
            variables: 0,
            constraints: 0,
          ));
    });

    test('does not show process, more than 2 variables', () {
      final container = createProviderContainer();
      container.read(entrySizeControllerProvider.notifier).setVariables('3');
      final entrySizeState = container.read(entrySizeControllerProvider);

      expect(entrySizeState, const EntrySizeState(variables: 3, constraints: 0, showProcess: false));
    });

    test('shows process, just 2 variables', () {
      final container = createProviderContainer();
      container.read(entrySizeControllerProvider.notifier).setVariables('2');
      final entrySizeState = container.read(entrySizeControllerProvider);

      expect(entrySizeState, const EntrySizeState(variables: 2, constraints: 0, showProcess: true));
    });

    test('sets contraints quantity', () {
      final container = createProviderContainer();
      container.read(entrySizeControllerProvider.notifier).setConstraints('3');
      final entrySizeState = container.read(entrySizeControllerProvider);

      expect(entrySizeState, const EntrySizeState(variables: 0, constraints: 3, showProcess: false));
    });
  });

  group('dataEntryController', () {
    ProviderContainer createProviderContainer({
      ProviderContainer? parent,
      List<Override> overrides = const [],
      List<ProviderObserver>? observers,
    }) {
      final container = ProviderContainer(
        parent: parent,
        overrides: overrides,
        observers: observers,
      );
      addTearDown(container.dispose);
      return container;
    }

    test('check default values', () {
      final container = createProviderContainer();
      final dataEntryState = container.read(dataEntryControllerProvider);

      expect(
          dataEntryState,
          const DataEntryState(
            objectiveFunction: [],
            constraints: [],
            operators: [],
            objective: Objectives.max,
          ));
    });

    test('updateObjective', () {
      final container = createProviderContainer();
      container.read(dataEntryControllerProvider.notifier).updateObjective(Objectives.min);
      final dataEntryState = container.read(dataEntryControllerProvider);

      expect(
          dataEntryState,
          const DataEntryState(
            objectiveFunction: [],
            constraints: [],
            operators: [],
            objective: Objectives.min,
          ));
    });

    test('updateObjectiveFunction', () {
      final overrides = [entrySizeControllerProvider.overrideWith(MockSizeEntryNonSimplex.new)];
      final container = createProviderContainer(overrides: overrides);
      container.read(dataEntryControllerProvider.notifier).updateObjectiveFunction(0, 1.23);
      final dataEntryState = container.read(dataEntryControllerProvider);

      expect(
          dataEntryState,
          const DataEntryState(
            objectiveFunction: [1.23, 0.0],
            constraints: [
              [0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0]
            ],
            operators: [Operators.leq, Operators.leq, Operators.leq],
            objective: Objectives.max,
          ));
    });

    test('updateConstraints', () {
      final overrides = [entrySizeControllerProvider.overrideWith(MockSizeEntryNonSimplex.new)];
      final container = createProviderContainer(overrides: overrides);
      container.read(dataEntryControllerProvider.notifier).updateConstraints(0, 0, 1.23);
      final dataEntryState = container.read(dataEntryControllerProvider);

      expect(
          dataEntryState,
          const DataEntryState(
            objectiveFunction: [0.0, 0.0],
            constraints: [
              [1.23, 0.0, 0.0],
              [0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0]
            ],
            operators: [Operators.leq, Operators.leq, Operators.leq],
            objective: Objectives.max,
          ));
    });
    test('updateOperator', () {
      final overrides = [entrySizeControllerProvider.overrideWith(MockSizeEntryNonSimplex.new)];
      final container = createProviderContainer(overrides: overrides);
      container.read(dataEntryControllerProvider.notifier).updateOperator(0, Operators.equal);
      final dataEntryState = container.read(dataEntryControllerProvider);

      expect(
          dataEntryState,
          const DataEntryState(
            objectiveFunction: [0.0, 0.0],
            constraints: [
              [0, 0.0, 0.0],
              [0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0]
            ],
            operators: [Operators.equal, Operators.leq, Operators.leq],
            objective: Objectives.max,
          ));
    });
    test('updateConstraintsRS', () {
      final overrides = [entrySizeControllerProvider.overrideWith(MockSizeEntryNonSimplex.new)];
      final container = createProviderContainer(overrides: overrides);
      container.read(dataEntryControllerProvider.notifier).updateConstraintsRS(0, 1.23);
      final dataEntryState = container.read(dataEntryControllerProvider);

      expect(
          dataEntryState,
          const DataEntryState(
            objectiveFunction: [0.0, 0.0],
            constraints: [
              [0.0, 0.0, 1.23],
              [0.0, 0.0, 0.0],
              [0.0, 0.0, 0.0]
            ],
            operators: [Operators.leq, Operators.leq, Operators.leq],
            objective: Objectives.max,
          ));
    });
  });
}
