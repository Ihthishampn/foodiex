
import 'package:flutter/material.dart';

import '../../../../constants/colors/my_colors.dart';
import '../../data/ui_model/food_model.dart';

class RestaurantCard extends StatelessWidget {
  final FoodItem item;
  const RestaurantCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon / Image area
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              _emoji(item.name),
              style: const TextStyle(fontSize: 36),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: item.tagColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.tag,
                          style: TextStyle(
                            fontSize: 10,
                            color: item.tagColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.restaurant,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 14,
                        color: AppColors.amber,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.rating,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.access_time,
                        size: 13,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        item.price,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accent,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _emoji(String name) {
    final n = name.toLowerCase();
    if (n.contains("dosa")) return "🫓";
    if (n.contains("paneer") || n.contains("tikka")) return "🍢";
    if (n.contains("biryani") || n.contains("prawn")) return "🍛";
    return "🍽️";
  }
}