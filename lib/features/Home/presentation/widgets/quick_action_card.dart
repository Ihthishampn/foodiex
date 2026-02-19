import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

import 'action_data.dart';

class QuickActionsGrid extends StatelessWidget {
  static const _actions = [
    ActionData(Icons.fastfood_rounded, "Order Now", AppColors.accent),
    ActionData(Icons.receipt_long_rounded, "My Orders", AppColors.purple),
    ActionData(Icons.local_offer_rounded, "Offers", AppColors.teal),
    ActionData(Icons.support_agent_rounded, "Support", AppColors.amber),
    ActionData(Icons.favorite_rounded, "Favorites", Color(0xFFEC4899)),
    ActionData(Icons.settings_rounded, "Settings", AppColors.textSecondary),
  ];

  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.1,
      children: _actions.map((a) => ActionTile(action: a)).toList(),
    );
  }
}



class ActionData {
  final IconData icon;
  final String label;
  final Color color;
  const ActionData(this.icon, this.label, this.color);
}