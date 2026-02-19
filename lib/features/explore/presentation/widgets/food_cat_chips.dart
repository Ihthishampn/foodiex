import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class FoodCategorySelector extends StatefulWidget {
  const FoodCategorySelector({super.key});

  @override
  State<FoodCategorySelector> createState() => _FoodCategorySelectorState();
}

class _FoodCategorySelectorState extends State<FoodCategorySelector> {
  int selectedIndex = -1;

  final List<Map<String, String>> categories = [
    {"emoji": "🍔", "name": "Burger"},
    {"emoji": "🍕", "name": "Pizza"},
    {"emoji": "🌯", "name": "Wrap"},
    {"emoji": "🍛", "name": "Biryani"},
    {"emoji": "🍰", "name": "Cake"},
    {"emoji": "🥪", "name": "Sandwich"},
    {"emoji": "🍟", "name": "Fries"},
    {"emoji": "🍩", "name": "Donut"},
    {"emoji": "🍖", "name": "Broast"},
    {"emoji": "🫓", "name": "Dosa"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.accent
                                : Colors.grey.shade300,
                            width: 3,
                          ),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Text(
                          item['emoji']!,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accent,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.check,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['name']!,
                    style: TextStyle(
                      color: isSelected ? AppColors.accent : Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
