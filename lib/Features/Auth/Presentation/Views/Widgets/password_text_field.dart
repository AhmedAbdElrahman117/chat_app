import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.validator,
  });

  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isSelected = false;

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: Visibility(
          visible: isVisible,
          child: IconButton(
            onPressed: () {
              isSelected = !isSelected;
              setState(() {});
            },
            icon: const Icon(FontAwesomeIcons.solidEye),
            selectedIcon: const Icon(FontAwesomeIcons.solidEyeSlash),
            isSelected: isSelected,
          ),
        ),
      ),
      obscureText: !isSelected,
      onChanged: widget.onChanged,
      onTap: () {
        isVisible = true;
        setState(() {});
      },
      onFieldSubmitted: (value) {
        isVisible = false;
        setState(() {});
      },
      validator: widget.validator,
    );
  }
}
