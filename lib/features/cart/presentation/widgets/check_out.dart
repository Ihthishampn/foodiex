import 'package:flutter/material.dart';
import 'package:foodiex/features/cart/presentation/widgets/check_out_row.dart';

class CheckoutSheet extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  const CheckoutSheet({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final int subtotal = cartItems.fold(
      0,
      (s, i) => s + (i['price'] as int) * (i['qty'] as int),
    );
    const int delivery = 25;
    const int tax = 10;
    final int total = subtotal + delivery + tax;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        16,
        20,
        MediaQuery.of(context).viewInsets.bottom + 28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Order Summary",
              style: TextStyle(
                color: Color(0xFF1A1A2E),
                fontWeight: FontWeight.w800,
                fontSize: 18,
                letterSpacing: -0.3,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Items
          ...cartItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: Image.asset(
                        item['image'] as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item['name'] as String,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                  Text(
                    "×${item['qty']}",
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "₹${(item['price'] as int) * (item['qty'] as int)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 24, thickness: 1, color: Color(0xFFF0F0F0)),

          // Breakdown
          CheckOutRow(label: "Subtotal", value: "₹$subtotal"),
          const SizedBox(height: 6),
          CheckOutRow(label: "Delivery", value: "₹$delivery"),
          const SizedBox(height: 6),
          CheckOutRow(label: "Tax & charges", value: "₹$tax"),

          const Divider(height: 24, thickness: 1, color: Color(0xFFF0F0F0)),

          CheckOutRow(
            label: "Total",
            value: "₹$total",
            bold: true,
            valueColor: const Color(0xFF2E7D32),
          ),

          const SizedBox(height: 20),

          // Address row
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7FB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Color(0xFF43A047),
                  size: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Kondotty,pulikkal 123",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),
                Text(
                  "Change",
                  style: TextStyle(
                    color: Color(0xFF43A047),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Pay button
          SizedBox(
            width: double.infinity,
            height: 54,
            child: DecoratedBox(
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
              child: const Center(
                child: Text(
                  "Place Order  →",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}