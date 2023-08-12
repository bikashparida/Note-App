import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/config/theme/theme.dart';

InputDecoration inputDecoration(String label, [EdgeInsets? contentPadding]) {
  return InputDecoration(
    label: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
      ),
    ),
    labelStyle: TextStyle(
      color: CustomTheme.lightGray,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(12, 12, 12, 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.58),
      borderSide: BorderSide(
        color: CustomTheme.appColor,
        width: 1.25,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.58),
      borderSide: const BorderSide(
        color: Colors.purple,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.58),
      borderSide: BorderSide(
        color: CustomTheme.red,
        width: 0.8,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.58),
      borderSide: BorderSide(
        color: CustomTheme.red,
        width: 0.8,
      ),
    ),
  );
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final int maxLines;
  final String? Function(String? value) validator;
  final void Function(String value)? onFieldSubmitted;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final InputDecoration? decorator;
  const CustomTextFormField({super.key, 
    required this.label,
    this.controller,
    this.maxLines = 1,
    required this.validator,
    this.onFieldSubmitted,
    this.textInputType,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.decorator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      decoration: inputDecoration(label),
      style: CustomTheme.labelRegular,
      cursorColor: CustomTheme.black,
      maxLines: maxLines,
      validator: validator,
      keyboardType: textInputType,
    );
  }
}
