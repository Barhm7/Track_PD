import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final keyboardType;
  final String labelText;
  const MyTextfield({
    super.key,
    required this.labelText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(223, 242, 239, 239),
        filled: true,
        labelText: labelText,
      ),
      keyboardType: keyboardType,
    );
  }
}
