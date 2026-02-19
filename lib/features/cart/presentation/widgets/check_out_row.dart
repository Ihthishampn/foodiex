
import 'package:flutter/material.dart';

class CheckOutRow extends StatelessWidget {
  final String label, value;
  final bool bold;
  final Color? valueColor;
  const CheckOutRow({super.key, 
    required this.label,
    required this.value,
    this.bold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: bold ? const Color(0xFF1A1A2E) : const Color(0xFF888888),
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
            fontSize: bold ? 15 : 13,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color:
                valueColor ??
                (bold ? const Color(0xFF1A1A2E) : const Color(0xFF1A1A2E)),
            fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
            fontSize: bold ? 17 : 13,
          ),
        ),
      ],
    );
  }
}