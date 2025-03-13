import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters; // Added inputFormatters

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.icon,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.onSuffixIconTap,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters, // Allow external input formatters
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters, // Apply input formatters
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: Color(0xFF000080)) : null,
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                suffixIcon,
                color: Color(0xFF000080),
              ),
              onPressed: onSuffixIconTap,
            )
                : null,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF000080), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
