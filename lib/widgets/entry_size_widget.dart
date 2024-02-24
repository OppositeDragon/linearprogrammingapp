import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:linearprogrammingapp/constants/enums.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';

import 'dropdown_button_widget.dart';
import 'textfield_widget.dart';

class EntrySizeWidget extends ConsumerStatefulWidget {
  const EntrySizeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EntrySizeWidgetState();
}

class _EntrySizeWidgetState extends ConsumerState<EntrySizeWidget> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController variablesController;
  late final TextEditingController constraintsController;
  @override
  void initState() {
    super.initState();
    variablesController = TextEditingController()
      ..text = ref.read(entrySizeControllerProvider).variables == 0
          ? ''
          : ref.read(entrySizeControllerProvider).variables.toString()
      ..addListener(
        () => ref.read(entrySizeControllerProvider.notifier).setVariables(variablesController.text),
      );
    constraintsController = TextEditingController()
      ..text = ref.read(entrySizeControllerProvider).constraints == 0
          ? ''
          : ref.read(entrySizeControllerProvider).constraints.toString()
      ..addListener(
        () => ref.read(entrySizeControllerProvider.notifier).setConstraints(constraintsController.text),
      );
  }

  @override
  void dispose() {
    variablesController.dispose();
    constraintsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dataEntrySizeState = ref.watch(entrySizeControllerProvider);
    variablesController.value = variablesController.value.copyWith(
      text: dataEntrySizeState.variables == 0 ? '' : dataEntrySizeState.variables.toString(),
    );
    constraintsController.value = constraintsController.value.copyWith(
      text: dataEntrySizeState.constraints == 0 ? '' : dataEntrySizeState.constraints.toString(),
    );
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 450,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(spaceL),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Descripción del problema',
                    style: textTheme.titleLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: spaceXXL),
                  TextFieldWidget(
                    controller: variablesController,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    label: "Cantidad de variables de decision",
                    keyboardType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    autoFocus: true,
                    // selectAllOnGainFocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un valor';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Debe ingresar un numero entero.';
                      }
                      if (int.parse(value) < 2) {
                        return 'Digite un numero entero mayor a 1.';
                      }
                      if (int.parse(value) > maxVariables) {
                        return 'No pueden haber mas de $maxVariables variables.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: spaceL),
                  TextFieldWidget(
                    controller: constraintsController,
                    onEditingComplete: () =>
                        dataEntrySizeState.showProcess ? FocusScope.of(context).nextFocus() : validate(),
                    label: "Cantidad de restricciones",
                    keyboardType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    selectAllOnGainFocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un valor';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Debe ingresar un numero entero.';
                      }
                      if (int.parse(value) < 1) {
                        return 'Digite un numero mayor a 0.';
                      }
                      if (int.parse(value) > 15) {
                        return 'No pueden haber mas de 15 restricciones.';
                      }
                      return null;
                    },
                  ),
                  if (dataEntrySizeState.showProcess) const SizedBox(height: spaceL),
                  if (dataEntrySizeState.showProcess)
                    Consumer(
                      builder: (context, ref, child) {
                        final process = ref.watch(processTypeControllerProvider);
                        return DropdownButtonWidget<ProcessTypes>(
                          label: 'Algoritmo a utilizar',
                          value: process,
                          onChanged: (value) {
                            if (value == null) return;
                            ref.read(processTypeControllerProvider.notifier).setProcess(value);
                          },
                          items: [
                            for (final process in ProcessTypes.values)
                              DropdownMenuItem(
                                value: process,
                                child: Text(process.label),
                              )
                          ],
                        );
                      },
                    ),
                  const SizedBox(height: spaceXXXL),
                  Row(
                    children: [
                      const Spacer(),
                      FocusTraversalGroup(
                        descendantsAreFocusable: false,
                        descendantsAreTraversable: false,
                        child: ElevatedButton(
                          onPressed: context.pop,
                          child: const Text('Regresar'),
                        ),
                      ),
                      const SizedBox(width: spaceXXXL),
                      FilledButton(
                        onPressed: validate,
                        child: const Text('Continuar'),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validate() {
    if (formKey.currentState!.validate()) {
      ref.read(entryPageControllerProvider.notifier).updatePage(1);
    }
  }
}
