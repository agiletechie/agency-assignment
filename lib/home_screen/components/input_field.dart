import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextInputType inputType;
  final Function(String?) onSaved;

  const InputField({
    Key? key,
    required this.labelText,
    required this.inputType,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
