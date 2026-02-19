

import 'package:flutter/material.dart';

import '../../../../constants/colors/my_colors.dart';
import 'quick_action_card.dart';

class ActionTile extends StatelessWidget {
  final ActionData action;
  const ActionTile({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: action.color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Icon(action.icon, color: action.color, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            action.label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}