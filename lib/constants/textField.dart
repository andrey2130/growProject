import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool isPassword; 

  const CustomTextField({
    super.key,
    this.keyboardType,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        SizedBox(
          width: 327,
          height: 48,
          child: TextFormField(
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? _isObscured : false,
            decoration: kTextFieldDecoration.copyWith(
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF2F7302),
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

const kTextFieldDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF2F7302),
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF2F7302)),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
);
