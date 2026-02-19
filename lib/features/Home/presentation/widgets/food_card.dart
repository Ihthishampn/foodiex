
import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';
import 'package:foodiex/features/Home/data/ui_model/food_model.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;
  const FoodCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    _emoji(item.name),
                    style: const TextStyle(fontSize: 52),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: item.tagColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  item.restaurant,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 14,
                          color: AppColors.amber,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          item.rating,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 12,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.time,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _emoji(String name) {
    final n = name.toLowerCase();
    if (n.contains("burger")) return "🍔";
    if (n.contains("pizza") || n.contains("margherita")) return "🍕";
    if (n.contains("roll") || n.contains("sushi") || n.contains("dragon"))
      return "🍣";
    if (n.contains("shawarma")) return "🌯";
    if (n.contains("dosa")) return "🫓";
    if (n.contains("paneer") || n.contains("tikka")) return "🍢";
    if (n.contains("biryani")) return "🍛";
    return "🍽️";
  }
}