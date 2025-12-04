import 'package:flutter/material.dart';

class NumberTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final String initialValue;
  const NumberTextField({
    super.key,
    this.validator,
    this.onSaved,
    required this.initialValue,
  });

  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
