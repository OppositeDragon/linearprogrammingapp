import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linearprogrammingapp/constants/numeric.dart';
import 'package:linearprogrammingapp/controllers/data_entry_controller.dart';

import 'textfield_widget.dart';

class DataSizeEntryWidget extends ConsumerStatefulWidget {
  const DataSizeEntryWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataSizeEntryWidgetState();
}

class _DataSizeEntryWidgetState extends ConsumerState<DataSizeEntryWidget> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController variablesController;
  late final TextEditingController constraintsController;
  @override
  void initState() {
    super.initState();
    variablesController = TextEditingController();
    constraintsController = TextEditingController();
  }

  @override
  void dispose() {
    variablesController.dispose();
    constraintsController.dispose();
    super.dispose();
  }

  updateValues() {
    if (formKey.currentState!.validate()) {
      ref.read(dataEntrySizeControllerProvider.notifier).updateValues(
            int.parse(variablesController.text),
            int.parse(constraintsController.text),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 300,
      ),
      child: Center(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un valor';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Debe ingresar un numero entero.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: spaceL),
                TextFieldWidget(
                  controller: constraintsController,
                  label: "Cantidad de restricciones",
                  keyboardType: TextInputType.number,
                  formatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un valor';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Debe ingresar un numero entero.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: spaceXXXL),
                FilledButton(onPressed: updateValues, child: const Text('Continuar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
