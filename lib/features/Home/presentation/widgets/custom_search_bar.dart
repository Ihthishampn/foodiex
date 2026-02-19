
import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search food, restaurants...",
          hintStyle: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          suffixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.tune, color: Colors.white, size: 20),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
