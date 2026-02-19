
import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;
  final bool compact;

  const SectionHeader({super.key, 
    required this.title,
    required this.onSeeAll,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, compact ? 4 : 16, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          if (onSeeAll != null)
            GestureDetector(
              onTap: onSeeAll,
              child: const Text(
                "See all",
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
