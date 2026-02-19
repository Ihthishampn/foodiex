import 'package:flutter/material.dart';

class CartItemTile extends StatefulWidget {
  final Map<String, dynamic> item;
  const CartItemTile({super.key, required this.item});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  late int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.item['qty'] as int;
  }

  @override
  Widget build(BuildContext context) {
    final int unitPrice = widget.item['price'] as int;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2A47),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Food image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 72,
              height: 72,
              child: Image.asset(
                widget.item['image'] as String,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Name + price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item['name'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "₹${unitPrice * qty}",
                  style: const TextStyle(
                    color: Color(0xFF4CAF50),
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                if (qty > 1)
                  Text(
                    "₹$unitPrice × $qty",
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 11,
                    ),
                  ),
              ],
            ),
          ),

          // Qty stepper
          _QtyStepper(
            qty: qty,
            onDecrement: () {
              if (qty > 1) setState(() => qty--);
            },
            onIncrement: () => setState(() => qty++),
          ),
        ],
      ),
    );
  }
}

class _QtyStepper extends StatelessWidget {
  final int qty;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const _QtyStepper({
    required this.qty,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF121A30),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepBtn(icon: Icons.remove, onTap: onDecrement),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "$qty",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          _StepBtn(icon: Icons.add, onTap: onIncrement),
        ],
      ),
    );
  }
}

class _StepBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _StepBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFF2E3F66),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}