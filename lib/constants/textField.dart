import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?) validator;
  final VoidCallback? onSuffixTap;
  final bool isSuffixVisible;
  final bool hasError;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    required this.validator,
    this.onSuffixTap,
    this.isSuffixVisible = false,
    this.hasError = false, // Add a hasError parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError
                ? Colors.red
                : Color(0xFF2F7302), // Change color based on error
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError
                ? Colors.red
                : Color(0xFF2F7302), // Change color based on error
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        suffixIcon: isSuffixVisible
            ? InkWell(
                onTap: onSuffixTap,
                child: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.green.shade800,
                ),
              )
            : null,
      ),
    );
  }
}
