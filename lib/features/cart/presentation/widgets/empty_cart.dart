import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xFF1E2A47),
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 52,
              color: Colors.white24,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Your cart is empty",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Add something delicious!",
            style: TextStyle(color: Colors.white38, fontSize: 13),
          ),
          const SizedBox(height: 28),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF1E2A47),
              padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Browse Food",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}