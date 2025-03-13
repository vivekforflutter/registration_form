import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) getLabel;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final String? Function(T?)? validator;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.getLabel,
    required this.onChanged,
    this.validator,
    this.hintText = "Select an option",
    this.icon = Icons.arrow_drop_down,
    this.iconColor = Colors.blue,
    this.iconSize = 35,
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
        DropdownButtonFormField<T>(
          value: value,
          decoration: InputDecoration(border: OutlineInputBorder()),
          hint: Text(hintText),
          items:
              items.map((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(getLabel(item)),
                );
              }).toList(),
          onChanged: onChanged,
          validator:
              validator ??
              (value) {
                if (value == null) {
                  return "This field is required";
                }
                return null;
              },
        ),
      ],
    );
  }
}
