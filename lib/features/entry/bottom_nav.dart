import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';
import 'package:foodiex/features/entry/provider/nav_provider.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});



  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

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
              (i) {
                final selected = nav.index == i;

                return GestureDetector(
                  onTap: () =>
                      context.read<NavigationProvider>().changeIndex(i),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.accent.withOpacity(0.12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          selected
                              ? _items[i].activeIcon
                              : _items[i].icon,
                          color: selected
                              ? AppColors.accent
                              : AppColors.textSecondary,
                          size: 24,
                        ),
                        if (selected) ...[
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  static const List<_NavItem> _items = [
  _NavItem(Icons.home_rounded, Icons.home_outlined, "Home"),
  _NavItem(Icons.explore_rounded, Icons.explore_outlined, "Explore"),
  _NavItem(Icons.shopping_bag_rounded, Icons.shopping_bag_outlined, "Cart"),
];



}
class _NavItem {
  final IconData activeIcon;
  final IconData icon;
  final String label;

  const _NavItem(this.activeIcon, this.icon, this.label);
}
