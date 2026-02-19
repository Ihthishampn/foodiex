import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNav({super.key, required this.selectedIndex, required this.onTap});

  static const _items = [
    _NavItem(Icons.home_rounded, Icons.home_outlined, "Home"),
    _NavItem(Icons.explore_rounded, Icons.explore_outlined, "Explore"),
    _NavItem(Icons.shopping_bag_rounded, Icons.shopping_bag_outlined, "Cart"),
    _NavItem(Icons.person_rounded, Icons.person_outlined, "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _items.length,
              (i) => GestureDetector(
                onTap: () => onTap(i),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selectedIndex == i
                        ? AppColors.accent.withOpacity(0.12)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedIndex == i
                            ? _items[i].activeIcon
                            : _items[i].icon,
                        color: selectedIndex == i
                            ? AppColors.accent
                            : AppColors.textSecondary,
                        size: 24,
                      ),
                      if (selectedIndex == i) ...[
                        const SizedBox(width: 6),
                        Text(
                          _items[i].label,
                          style: const TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  const _NavItem(this.activeIcon, this.icon, this.label);
}