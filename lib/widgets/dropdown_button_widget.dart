import 'package:flutter/material.dart';

import '../constants/numeric.dart';

class DropdownButtonWidget<T> extends StatefulWidget {
  const DropdownButtonWidget({
    super.key,
    this.value,
    this.onChanged,
    this.validator,
    required this.items,
    this.label,
    this.hint,
    this.isDense = false,
    this.readOnly = false,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.prefixIcon,
    this.suffixIcon,
  });
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final List<DropdownMenuItem<T>> items;
  final String? label;
  final String? hint;
  final bool isDense;
  final bool readOnly;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedBorderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  @override
  State<DropdownButtonWidget<T>> createState() => _DropdownButtonWidgetState<T>();
}

class _DropdownButtonWidgetState<T> extends State<DropdownButtonWidget<T>> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DropdownButtonFormField<T>(
      borderRadius: BorderRadius.circular(15),
      isExpanded: true,
      value: widget.value,
      onChanged: widget.onChanged,
      items: widget.items,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: const EdgeInsets.symmetric(vertical: spaceM, horizontal: spaceXL),
        hintText: widget.hint,
        isDense: widget.isDense,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: widget.enabledBorderColor ?? colorScheme.inversePrimary),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: widget.focusedBorderColor ?? colorScheme.primary),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: widget.errorBorderColor ?? colorScheme.error),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: widget.focusedBorderColor ?? colorScheme.error),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3,
              color: widget.disabledBorderColor ??
                  (colorScheme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.blueGrey.shade700)),
          borderRadius: BorderRadius.circular(spaceL),
        ),
      ),
    );
  }
}
