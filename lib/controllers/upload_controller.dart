import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/data_entry_model.dart';
import 'data_entry_controller.dart';

part 'upload_controller.freezed.dart';
part 'upload_controller.g.dart';

@riverpod
class UploadController extends _$UploadController {
  @override
  UploadState build() {
    return const UploadState();
  }

  void toggleHelpMessage([bool? value]) {
    if (value != null) {
      state = state.copyWith(showHelpMessage: value);
      return;
    }
    state = state.copyWith(showHelpMessage: !state.showHelpMessage);
  }

  (int variables, int constraints) operateOnContent(String jsonContent) {
    try {
      final map = json.decode(jsonContent);
      final data = DataEntryModel.fromJson(map);
      if (data.constraints.isEmpty || data.objectiveFunction.isEmpty) {
        throw Exception('No se puede operar, faltan datos.');
      }
      if (data.constraints.length != data.operators.length) {
        throw Exception('La cantidad de restricciones no concuerda con la cantidad de operadores.');
      }
      if (data.constraints.first.length - 1 != data.objectiveFunction.length) {
        throw Exception(
            'La cantidad de variables de la funcion objetivo no concuerda con la cantidad de variables de las restricciones.');
      }
      if (data.constraints.length > maxConstraints || data.objectiveFunction.length > maxVariables) {
        throw Exception('La cantidad de variables o restricciones excede el limite permitido.');
      }
      ref.read(entrySizeControllerProvider.notifier).setData(data.objectiveFunction.length, data.constraints.length);
      ref.read(dataEntryControllerProvider.notifier).setData(data);
      if (data.objectiveFunction.length > 2) ref.read(entryPageControllerProvider.notifier).updatePage(1);
      return (data.objectiveFunction.length, data.constraints.length);
    } on FormatException {
      throw Exception('El archivo no es un JSON valido.');
    } catch (e) {
      if (e.toString().contains('Invalid')) {
        throw Exception('Asegurese de incluir todos los datos requeridos, bajo el formato especificado.');
      }
      rethrow;
    }
  }
}

@freezed
class UploadState with _$UploadState {
  const UploadState._();
  const factory UploadState({
    @Default(false) bool showHelpMessage,
  }) = _UploadState;
}
