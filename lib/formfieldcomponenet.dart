import 'package:flutter/material.dart';
import 'package:textformfieldex/signupmodel.dart';

class MyTextFormFeild extends StatelessWidget {
  final SignUpData data;
  const MyTextFormFeild({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: data.function,
        controller: data.controller,
        obscureText: data.obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: data.label,
          suffixIcon: Icon(data.icon),
        ),
      ),
    );
  }
}
