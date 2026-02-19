
import 'package:flutter/material.dart';

import '../../../../constants/colors/my_colors.dart';

class FoodSearchBar extends StatefulWidget {
  const FoodSearchBar({super.key});

  @override
  State<FoodSearchBar> createState() => _FoodSearchBarState();
}

class _FoodSearchBarState extends State<FoodSearchBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _glow;
  final FocusNode _focus = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _glow = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _focus.addListener(() {
      setState(() => _focused = _focus.hasFocus);
      _focused ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glow,
      builder: (context, child) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              // base shadow — always visible
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
              // accent glow — appears on focus
              BoxShadow(
                color: AppColors.accent.withOpacity(0.30 * _glow.value),
                blurRadius: 16,
                spreadRadius: 1,
              ),
            ],
            border: Border.all(
              color: AppColors.accent.withOpacity(0.55 * _glow.value),
              width: 1.5,
            ),
          ),
          child: child,
        );
      },
      child: TextField(
        focusNode: _focus,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1A1A2E),
        ),
        decoration: InputDecoration(
          hintText: "Search restaurants or food…",
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade400,
          ),
          // Search icon on the left
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.search_rounded,
              size: 20,
              color: _focused ? AppColors.accent : Colors.grey.shade400,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 48),
          // Mic icon on the right
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.mic_none_rounded,
                size: 18,
                color: AppColors.accent,
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 48),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}