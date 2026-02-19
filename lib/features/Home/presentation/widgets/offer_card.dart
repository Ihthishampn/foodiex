
import 'package:flutter/material.dart';
import 'package:foodiex/features/Home/data/ui_model/food_model.dart';

class OfferCard extends StatelessWidget {
  final OfferItem offer;
  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: offer.gradient),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  offer.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  offer.subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Use: ${offer.code}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text("🎉", style: TextStyle(fontSize: 48)),
        ],
      ),
    );
  }
}
