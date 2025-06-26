import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    this.onTap,
    this.onChanged,
    this.controller,
    this.validator,
    required this.text,
    required this.icon,
  });

  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        labelText: text,
        prefixIcon: Icon(icon),
      ),
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
    );
  }
}
