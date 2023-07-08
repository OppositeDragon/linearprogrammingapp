import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_entry_controller.g.dart';

typedef DataEntrySize = ({int variables, int constraints});

@riverpod
class DataEntrySizeController extends _$DataEntrySizeController {
  @override
  DataEntrySize build() => (variables: 0, constraints: 0);

  void updateValues(int variables, int constraints) {
    state = (variables: variables, constraints: constraints);
    debugPrint('DataEntrySizeController: $state');
  }
}
