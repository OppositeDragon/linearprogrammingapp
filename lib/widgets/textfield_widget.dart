import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/numeric.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    this.action,
    this.label,
    this.style,
    this.focusNode,
    this.hint,
    this.initialValue,
    this.maxLength,
    this.maxLines = 1,
    this.required = false,
    this.obscureText = false,
    this.isDense = false,
    this.enabled = true,
    this.readOnly = false,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.onSave,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.formatters,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    super.key,
  });
  final TextInputAction? action;
  final FocusNode? focusNode;
  final String? label;
  final TextStyle? style;
  final String? hint;
  final String? initialValue;
  final int? maxLength;
  final int? maxLines;
  final bool required;
  final bool obscureText;
  final bool isDense;
  final bool enabled;
  final bool readOnly;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedBorderColor;
  final void Function(String?)? onSave;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      keyboardType: widget.keyboardType,
      textInputAction: widget.action,
      style: widget.style,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      focusNode: widget.focusNode,
      controller: widget.controller,
      inputFormatters: widget.formatters,
      initialValue: widget.initialValue,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      validator: widget.validator,
      onSaved: widget.onSave,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
