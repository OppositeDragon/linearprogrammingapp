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
    this.obscureText = false,
    this.isDense = false,
    this.enabled = true,
    this.readOnly = false,
    this.autoFocus = false,
    this.selectAllOnGainFocus = false,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.onSave,
    this.onChanged,
    this.onTap,
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
  final bool obscureText;
  final bool isDense;
  final bool enabled;
  final bool readOnly;
  final bool selectAllOnGainFocus;
  final bool autoFocus;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedBorderColor;
  final void Function(String?)? onSave;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
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
  late TextEditingController textController;
  late FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    textController = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      if (widget.selectAllOnGainFocus && focusNode.hasFocus) {
        textController.selection = TextSelection(baseOffset: 0, extentOffset: textController.text.length);
      }
    });
  }

  @override
  dispose() {
    if (widget.controller == null) {
      textController.dispose();
    }
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future(() {
      textController.value = textController.value.copyWith(text: widget.initialValue);
    });
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      autofocus: widget.autoFocus,
      focusNode: focusNode,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      textInputAction: widget.action,
      style: widget.style,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      controller: textController,
      inputFormatters: widget.formatters,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      validator: widget.validator,
      onSaved: widget.onSave,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        contentPadding: const EdgeInsets.symmetric(
          vertical: spaceM,
          horizontal: spaceL,
        ),
        hintText: widget.hint,
        isDense: widget.isDense,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: spaceXS,
            color: widget.enabledBorderColor ?? colorScheme.inversePrimary,
          ),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: widget.focusedBorderColor ?? colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: widget.errorBorderColor ?? colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: spaceXS,
            color: widget.focusedBorderColor ?? colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(spaceL),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: widget.disabledBorderColor ??
                (colorScheme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.blueGrey.shade700),
          ),
          borderRadius: BorderRadius.circular(spaceL),
        ),
      ),
    );
  }
}
