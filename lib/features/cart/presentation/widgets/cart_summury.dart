import 'package:flutter/material.dart';

class CartSummaryBar extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final VoidCallback onCheckoutTap;

  const CartSummaryBar({
    super.key,
    required this.cartItems,
    required this.onCheckoutTap,
  });

  @override
  Widget build(BuildContext context) {
    final int subtotal = cartItems.fold(
      0,
      (s, i) => s + (i['price'] as int) * (i['qty'] as int),
    );
    final int total = subtotal + 25 + 10;
    final int count = cartItems.fold(0, (s, i) => s + (i['qty'] as int));

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onCheckoutTap,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF43A047), Color(0xFF2E7D32)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF43A047).withOpacity(0.35),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              // Item count badge
              Container(
                margin: const EdgeInsets.all(8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "$count",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              const Expanded(
                child: Text(
                  "Checkout",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 0.3,
                  ),
                ),
              ),

              // Total
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "₹$total",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}