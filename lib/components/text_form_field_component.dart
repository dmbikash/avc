import 'package:flutter/material.dart';

import '../theme/colors.dart';


/// bikash's TextFormFields component with two layout presets.
class TextFormFields extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyBoardType;
  final bool required;
  final int fieldPreset;
  final int maxLines;
  final String? Function(String?)? validator;

  const TextFormFields({
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.required = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyBoardType = TextInputType.text,
    required this.fieldPreset,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Define the TextFormField widget to reuse in both layouts.
    final textFormFieldWidget = TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: ThemeColor.primary, width: 3.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      ),
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: keyBoardType,
      validator: required ? validator : null,
    );

    // Layout selection based on fieldpreset value.
    if (fieldPreset == 1) {
      // Current preset: Title above TextFormField.
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          textFormFieldWidget,
        ],
      );
    } else if (fieldPreset == 2) {
      // New preset: Title and TextFormField in a row.
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 8),
          Expanded(child: textFormFieldWidget),
        ],
      );
    } else {
      // Fallback to preset 1 if an unexpected value is provided.
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          textFormFieldWidget,
        ],
      );
    }
  }
}
