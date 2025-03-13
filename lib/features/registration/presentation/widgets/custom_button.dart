import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary; // Determines the color scheme

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true, // Default is primary color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0xFF000080) : Colors.white,
        // Navy Blue or White
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          side:
              isPrimary
                  ? BorderSide.none
                  : const BorderSide(
                    color: Color(0xFF000080),
                  ), // Border for white button
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color:
              isPrimary
                  ? Colors.white
                  : const Color(
                    0xFF000080,
                  ), // White text for primary, navy text for secondary
        ),
      ),
    );
  }
}
