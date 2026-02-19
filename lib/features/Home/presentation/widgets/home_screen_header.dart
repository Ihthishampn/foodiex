
import 'package:flutter/material.dart';
import 'package:foodiex/constants/colors/my_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Avatar
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.accent, AppColors.accentSoft],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "I",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Location
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.accent,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Kondotty",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white54,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  // Notification
                  Stack(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Hey there! 👋",
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                "What would you like\nto eat today?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}