import 'package:flutter/material.dart';

class SignUpData {
  String label;
  IconData icon;
  TextEditingController controller;
  FormFieldValidator<String?> function;
  bool obscureText;

  SignUpData({
    required this.label,
    required this.icon,
    required this.controller,
    required this.function,
    this.obscureText = false,
  });
}
