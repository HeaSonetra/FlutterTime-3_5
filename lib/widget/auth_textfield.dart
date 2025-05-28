import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/controller/auth_controller.dart';

class AuthTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isPasswords;

  AuthTextfield({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.isPasswords = false,
  });

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isPasswords
        ? Obx(() => TextField(
              controller: controller,
              obscureText: _authController.isPasswordHind.value,
              decoration: InputDecoration(
                labelText: label,
                prefixIcon: Icon(icon),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _authController.isPasswordHind.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: _authController.toggleHindPass,
                ),
              ),
            ))
        : TextField(
            controller: controller,
            obscureText: false,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(icon),
              border: const OutlineInputBorder(),
            ),
          );
  }
}
