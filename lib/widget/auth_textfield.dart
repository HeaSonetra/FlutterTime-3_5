

import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  bool isPasswords;

  AuthTextfield({super.key, required this.controller, required this.label, required this.icon,this.isPasswords=false});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: isPasswords,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder()
        ),
    );
  }
}