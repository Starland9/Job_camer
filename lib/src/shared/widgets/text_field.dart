import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class CustomTexTField extends StatelessWidget {
  const CustomTexTField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.minLines,
    this.maxLines,
    this.keyboardType,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.controller,
    this.validator,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      controller: widget.controller,
      validator: ValidationBuilder().minLength(6).maxLength(20).build(),
      maxLength: 20,
      decoration: InputDecoration(
        hintText: "Mot de passe",
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }

  bool _isObscure = true;
}
